import json,urllib.request,subprocess,pathlib,datetime
root=pathlib.Path.cwd();out=root/'outputs/db-init';stamp=datetime.datetime.now().strftime('%Y%m%d%H%M%S')
args=['docker','exec','-i','-e','MYSQL_PWD=123456','nomix-works-mysql','mysql','-uroot','-N','--default-character-set=utf8mb4','nomix-works']
backup=subprocess.run(args,input=b'SELECT JSON_OBJECT("id",id,"property",property) FROM promotion_diy_page WHERE tenant_id=1;',capture_output=True,check=True).stdout
(out/f'decoration-before-{stamp}.jsonl').write_bytes(backup)
req=urllib.request.Request('http://127.0.0.1:48080/app-api/promotion/diy-template/used',headers={'tenant-id':'1'})
t=json.load(urllib.request.urlopen(req))['data']
def style(bg='#ffffff'):
 return dict(bgType='color',bgColor=bg,marginLeft=12,marginRight=12,marginBottom=12,paddingTop=12,paddingBottom=12,paddingLeft=12,paddingRight=12,borderTopLeftRadius=12,borderTopRightRadius=12,borderBottomLeftRadius=12,borderBottomRightRadius=12)
def block(id,**p):return {'id':id,'property':{'style':style(),**p}}
def title(s,desc='',url=''):
 return block('TitleBar',title=s,description=desc,titleSize=18,descriptionSize=12,titleWeight=600,descriptionWeight=400,textAlign='left',titleColor='#252525',descriptionColor='#888888',height=56,marginLeft=0,more={'show':bool(url),'type':'text','text':'查看全部','url':url})
def item(s,url,icon='category',subtitle=''):
 return dict(title=s,titleColor='#333333',subtitle=subtitle,subtitleColor='#999999',url=url,iconUrl=f'http://127.0.0.1:3000/static/local-init/{icon}-active.svg',badge={'show':False,'text':'','textColor':'#fff','bgColor':'#fc4141'})
home=t['home'];user=t['user']
for page,name in [(home,'Nomix商城'),(user,'个人中心')]:
 page['page']={'description':name,'backgroundColor':'#f6f6f6','backgroundImage':''}
 for cell in page['navigationBar']['otherCells']+page['navigationBar']['mpCells']:cell['text']=name
home['components']=[
 block('SearchBar',height=36,showScan=False,borderRadius=18,placeholder='搜索你喜欢的商品',placeholderPosition='left',backgroundColor='#f5f5f5',textColor='#999999',hotKeywords=[]),
 block('Carousel',type='default',indicator='dot',autoplay=True,interval=5,height=174,items=[{'type':'img','imgUrl':f'','videoUrl':'','url':'/pages/index/category'} for i in (1,2)]),
 block('MenuGrid',column=4,list=[item('全部分类','/pages/index/category'),item('逛逛商品','/pages/goods/list','index'),item('购物车','/pages/index/cart','cart'),item('个人中心','/pages/index/user','user')]),
 title('发现好物','挑选适合自己的日常好物','/pages/goods/list'),
 block('MenuList',list=[item('全部商品','/pages/goods/list','index','查看商品列表'),item('我的收藏','/pages/user/goods-collect','user','收藏喜欢的好物')]),
 title('好物即将上架','商品正在准备中，欢迎先逛逛商城')]
user['components']=[block('UserCard',space=0,style=style('#fff1f0')),title('我的订单',url='/pages/order/list'),block('UserOrder',space=0),block('UserWallet',space=0),title('常用服务'),block('MenuGrid',column=4,list=[item('我的收藏','/pages/user/goods-collect','index'),item('浏览足迹','/pages/user/goods-log','category'),item('收货地址','/pages/user/address/list','cart'),item('个人信息','/pages/user/info','user')]),block('MenuList',list=[item('登录 / 账户信息','/pages/user/info','user','管理个人资料'),item('地址管理','/pages/user/address/list','category','管理收货地址')])]
def lit(s):return 'CONVERT(0x'+s.encode().hex()+' USING utf8mb4) COLLATE utf8mb4_unicode_ci'
sql='SET NAMES utf8mb4;\nSTART TRANSACTION;\n'
for name,page in [('首页',home),('我的',user)]:
 sql+=f"UPDATE promotion_diy_page SET property={lit(json.dumps(page,ensure_ascii=False))},update_time=NOW() WHERE tenant_id=1 AND template_id={int(t['id'])} AND name={lit(name)} AND deleted=0;\n"
sql+='COMMIT;\n'
(root/'sql/mysql/local-init/03-mall-decoration.sql').write_text(sql,encoding='utf8')
r=subprocess.run(args,input=sql.encode(),capture_output=True,check=True);print(r.stderr.decode());print('Decorated template',t['id'],'home',len(home['components']),'user',len(user['components']))
