const fs = require('node:fs');
const path = require('node:path');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const source = fs.readFileSync(path.join(root, 'design/Helix.svg'), 'utf8');
const screens = JSON.parse(fs.readFileSync(path.join(root, 'design/reference/screens.json'), 'utf8'));
(async () => {
  for (const [name, [x, y, w, h]] of Object.entries(screens)) {
    const svg = source.replace(/<svg[^>]+>/, `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="${w * 3}" height="${h * 3}" viewBox="${x} ${y} ${w} ${h}" fill="none">`);
    await sharp(Buffer.from(svg)).png().toFile(path.join(root, `design/reference/${name}.png`));
  }
})().catch(error => { console.error(error); process.exitCode = 1; });
