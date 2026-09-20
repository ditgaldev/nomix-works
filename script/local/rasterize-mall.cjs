const fs=require('fs'),path=require('path');const {Resvg}=require('../../outputs/design-tools/node_modules/@resvg/resvg-js');
const dir=path.resolve('nomix-ui/nomix-ui-mall-uniapp/static/local-init');
for(const file of fs.readdirSync(dir).filter(f=>f.endsWith('.svg'))){const svg=fs.readFileSync(path.join(dir,file));fs.writeFileSync(path.join(dir,file.replace('.svg','.png')),new Resvg(svg,{font:{loadSystemFonts:true,defaultFontFamily:'Microsoft YaHei'}}).render().asPng());}
console.log('PNG assets ready');
