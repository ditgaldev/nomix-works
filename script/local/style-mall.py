from pathlib import Path
p=Path('nomix-ui/nomix-ui-mall-uniapp');assets=p/'static/local-init'
art=[('cup','#e9e2d7','<path d="M165 165H350V350Q260 420 165 350Z" fill="#f7f4e9"/><path d="M350 195H375Q440 195 417 280Q399 310 352 292" fill="none" stroke="#f7f4e9" stroke-width="26"/><ellipse cx="258" cy="165" rx="93" ry="20" fill="#d4c2aa"/><ellipse cx="258" cy="164" rx="78" ry="12" fill="#69523d"/>'),('bag','#e1e7db','<path d="M160 155H355L379 368Q260 399 138 368Z" fill="#f7f3e7"/><path d="M205 168V124C205 64 315 64 315 124V168" fill="none" stroke="#b8a082" stroke-width="17"/><text x="183" y="270" fill="#355b45" font-family="serif" font-size="35">EVERYDAY</text>'),('lamp','#e7e5df','<ellipse cx="265" cy="391" rx="93" ry="17" fill="#59745e"/><rect x="256" y="194" width="17" height="194" fill="#59745e"/><path d="M142 212Q145 82 265 82Q385 82 389 212Z" fill="#749477"/><ellipse cx="265" cy="211" rx="123" ry="18" fill="#d8d7b8"/>'),('book','#e8ddd4','<g transform="rotate(-12 260 250)"><rect x="153" y="100" width="223" height="306" rx="8" fill="#426251"/><path d="M170 100V406" stroke="#91a58c" stroke-width="2"/><text x="200" y="191" fill="#f4f1e5" font-family="serif" font-size="28">SLOW</text><text x="200" y="232" fill="#f4f1e5" font-family="serif" font-size="28">DAYS.</text><path d="M200 316H316M200 327H281" stroke="#a2b194" stroke-width="2"/></g>')]
for name,bg,body in art:
 assets.joinpath('demo-'+name+'.svg').write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="520" height="520"><rect width="520" height="520" fill="{bg}"/><ellipse cx="262" cy="410" rx="140" ry="19" fill="#000" opacity=".05"/>{body}<text x="26" y="483" fill="#72796d" font-family="sans-serif" font-size="14" letter-spacing="3">STUDIO / DEMO</text></svg>',encoding='utf8')
css='''
.modern-store {font-family: "PingFang SC", "Microsoft YaHei", sans-serif; color:#263e31;
 :deep(.nav-title) {font-size:18px;font-weight:600;letter-spacing:2px;}
 :deep(.menu-image) {width:48px!important;height:48px!important;}
 :deep(.grid-text) {font-size:12px;margin-top:9px;font-weight:500;}
 :deep(.grid-tip) {display:none;}
 :deep(.sub-title-text) {margin-top:7px;letter-spacing:.5px;}
 :deep(.ss-user-info-wrap) {padding-top:24px;padding-bottom:24px;}
 :deep(.avatar-box) {border:3px solid #fff;box-shadow:0 4px 14px #284c3b12;}
 :deep(.nick-name) {font-weight:600;font-size:21px;color:#234332;}
 :deep(.menu-title) {font-size:12px!important;}
}
'''
(p/'pages/index/modern-store.scss').write_text(css,encoding='utf8')
f=p/'pages/index/index.vue';s=f.read_text(encoding='utf8').replace('<view v-if="template">','<view v-if="template" class="modern-store">');s+='\n<style lang="scss" scoped>\n@import "./modern-store.scss";\n</style>\n';f.write_text(s,encoding='utf8')
f=p/'pages/index/user.vue';s=f.read_text(encoding='utf8').replace('<template>','<template>\n  <view class="modern-store">',1).replace('</template>','  </view>\n</template>',1).replace('<style></style>','<style lang="scss" scoped>\n@import "./modern-store.scss";\n</style>');f.write_text(s,encoding='utf8')
f=p/'sheep/components/s-user-card/s-user-card.vue';s=f.read_text(encoding='utf8').replace('<view class="nickname-box ss-flex ss-col-center">','<view class="nickname-box ss-flex ss-col-center" @tap="sheep.$router.go(\'/pages/user/info\')">');f.write_text(s,encoding='utf8')
