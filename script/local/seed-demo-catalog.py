import json,pathlib,urllib.request,urllib.error,subprocess
root=pathlib.Path.cwd();out=root/'outputs/db-init';mf=out/'demo-catalog.json';m=json.loads(mf.read_text(encoding='utf8')) if mf.exists() else {};headers={'tenant-id':'1','Content-Type':'application/json'}
def api(path,data=None,method=None,app=False):
 req=urllib.request.Request('http://127.0.0.1:48080/'+('app-api' if app else 'admin-api')+path,data=json.dumps(data).encode() if data is not None else None,headers=headers,method=method)
 try:r=json.load(urllib.request.urlopen(req))
 except urllib.error.HTTPError as e:raise RuntimeError(path+' '+e.read().decode())
 if r['code']!=0:raise RuntimeError(path+' '+json.dumps(r,ensure_ascii=False))
 return r['data']
headers['Authorization']='Bearer '+api('/system/auth/login',{'username':'admin','password':'admin123'})['accessToken']
base='http://127.0.0.1:3000/static/local-init/'
def save():mf.write_text(json.dumps(m,ensure_ascii=False,indent=2),encoding='utf8')
def ensure(key,path,data):
 if key not in m:m[key]=api(path,data);save()
 return m[key]
brand=ensure('brand','/product/brand/create',dict(name='日常选物 · 演示',picUrl=base+'demo-bag.png',sort=1,status=0,description='仅用于本地展示'))
products=[('cup','陶瓷马克杯',3900,'一杯暖意，留给慢下来的时刻','居家日用','杯具'),('bag','日常帆布袋',5900,'轻装出门，装下每一份喜欢','随身好物','包袋'),('lamp','森林绿台灯',12900,'给阅读角落，一束温柔的光','居家日用','灯具'),('book','留白手帐本',2900,'记录灵感，也记录平凡日常','随身好物','文具')]
for key,name,price,intro,parent,child in products:
 pic=base+'demo-'+key+'.png';pid=ensure('parent-'+parent,'/product/category/create',dict(parentId=0,name=parent+'（演示）',picUrl=pic,sort=1,status=0))
 cid=ensure('category-'+key,'/product/category/create',dict(parentId=pid,name=child+'（演示）',picUrl=pic,sort=1,status=0))
 sku=dict(name=name,price=price,marketPrice=price,costPrice=price,barCode='LOCAL-DEMO-'+key,picUrl=pic,stock=20,weight=.3,volume=.01,firstBrokeragePrice=0,secondBrokeragePrice=0,properties=[])
 ensure('spu-'+key,'/product/spu/create',dict(name=name+'（演示）',keyword=name,introduction=intro,description='<p>本地演示商品，仅用于页面与功能体验，不提供真实交易及发货。</p><p>'+intro+'</p><img src="'+pic+'"/>',categoryId=cid,brandId=brand,picUrl=pic,sliderPicUrls=[pic],sort=10,specType=False,deliveryTypes=[1],deliveryTemplateId=0,giveIntegral=0,subCommissionType=False,virtualSalesCount=0,skus=[sku]))
# Replace only the active local template, keeping all components editable in the admin editor.
headers.pop('Authorization',None)
t=api('/promotion/diy-template/used',app=True)
for page in [t['home'],t['user']]:
 for cell in page['navigationBar']['otherCells']+page['navigationBar']['mpCells']:cell.update(width=6,left=0)
 for c in page['components']:
  def convert(o):
   if isinstance(o,dict):return {k:convert(v) for k,v in o.items()}
   if isinstance(o,list):return [convert(v) for v in o]
   if isinstance(o,str) and base in o:return o.replace('.svg','.png')
   return o
  c['property']=convert(c['property'])
t['property']=convert(t['property'])
p={'layoutType':'twoCol','fields':{k:{'show':k in ['name','price'],'color':'#284c3b' if k=='price' else '#303d32'} for k in ['name','introduction','price','marketPrice','salesCount','stock']},'badge':{'show':False,'imgUrl':''},'btnBuy':{'type':'text','text':'看看','bgBeginColor':'#284c3b','bgEndColor':'#284c3b','imgUrl':''},'borderRadiusTop':16,'borderRadiusBottom':16,'space':10,'spuIds':[m['spu-'+x[0]] for x in products],'style':{'bgType':'color','bgColor':'','marginLeft':20,'marginRight':20,'marginBottom':20}}
t['home']['components']=[c for c in t['home']['components'] if c['id'] not in ['ProductCard','MenuList']]+[{'id':'ProductCard','property':p}]
args=['docker','exec','-i','-e','MYSQL_PWD=123456','nomix-htzx-mysql','mysql','-uroot','-N','nomix-vue-pro']
def lit(s):return 'CONVERT(0x'+s.encode().hex()+' USING utf8mb4)'
sql='START TRANSACTION;\n'
for name,page in [('首页',t['home']),('我的',t['user'])]:sql+=f"UPDATE promotion_diy_page SET property={lit(json.dumps(page,ensure_ascii=False))} WHERE template_id={t['id']} AND tenant_id=1 AND name={lit(name)} COLLATE utf8mb4_unicode_ci AND deleted=0;\n"
sql+=f"UPDATE promotion_diy_template SET property={lit(json.dumps(t['property']))} WHERE id={t['id']} AND tenant_id=1;\nCOMMIT;"
(root/'sql/mysql/local-init/05-demo-decoration.sql').write_text(sql,encoding='utf8');subprocess.run(args,input=sql.encode(),check=True)
# Dedicated local demo member, no existing member is modified.
if 'member' not in m:
 password='Demo@2026'; hashed=subprocess.check_output(['D:/application/node/node.exe','-e',"process.stdout.write(require('./outputs/design-tools/node_modules/bcryptjs').hashSync('Demo@2026',10))"]).decode()
 sql=f"INSERT INTO member_user(mobile,password,status,register_ip,register_terminal,nickname,avatar,point,experience,tenant_id) SELECT '19900000001','{hashed}',0,'127.0.0.1',20,{lit('演示体验官')},'{base}user-modern.png',0,0,1 WHERE NOT EXISTS(SELECT 1 FROM member_user WHERE mobile='19900000001' AND tenant_id=1);"
 subprocess.run(args,input=sql.encode(),check=True);m['member']='19900000001';save()
headers['Authorization']='Bearer '+api('/member/auth/login',dict(mobile='19900000001',password='Demo@2026'),app=True)['accessToken']
cart=api('/trade/cart/list',app=True);existing={i['spu']['id'] for i in cart['validList']+cart['invalidList']}
for key,*_ in products[:2]:
 detail=api('/product/spu/get-detail?id='+str(m['spu-'+key]),app=True)
 if m['spu-'+key] not in existing:api('/trade/cart/add',{'skuId':detail['skus'][0]['id'],'count':1},app=True)
print(json.dumps({'products':4,'categories':6,'cart_items':len(api('/trade/cart/list',app=True)['validList']),'demo_mobile':m['member']},ensure_ascii=False))




