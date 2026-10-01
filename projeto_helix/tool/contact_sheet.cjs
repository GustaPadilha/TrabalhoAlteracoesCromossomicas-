const fs = require('node:fs');
const path = require('node:path');
const sharp = require('sharp');
const root = path.resolve(__dirname, '..');
const screens = [
  ['welcome', 'Apresentação'], ['register', 'Cadastro'], ['login', 'Login'], ['home', 'Início'],
  ['profile', 'Perfil'], ['concepts', 'Conceitos'], ['videos', 'Vídeos'], ['sites', 'Sites'],
  ['flashcard', 'Cartão de estudo'], ['flashcards', 'Lista de cartões'], ['alterations', 'Alterações'], ['detail', 'Detalhe'],
];
(async () => {
  const gallery = [];
  const comparison = [];
  for (let i = 0; i < screens.length; i++) {
    const [name, label] = screens[i];
    const image = await sharp(path.join(root, `design/preview/${name}.png`)).resize({ width: 283 }).png().toBuffer();
    gallery.push({ input: image, left: (i % 4) * 315 + 16, top: Math.floor(i / 4) * 730 + 42 });
    gallery.push({ input: Buffer.from(`<svg width="283" height="30"><text x="0" y="22" font-family="Arial" font-size="17" fill="#E6DAC8">${String(i + 1).padStart(2, '0')} · ${label}</text></svg>`), left: (i % 4) * 315 + 16, top: Math.floor(i / 4) * 730 + 8 });
    for (let j = 0; j < 2; j++) {
      const frame = await sharp(path.join(root, `design/${j ? 'preview' : 'reference'}/${name}.png`)).resize({ width: 283 }).png().toBuffer();
      comparison.push({ input: frame, left: (i % 4) * 580 + j * 283, top: Math.floor(i / 4) * 710 });
    }
  }
  await sharp({ create: { width: 1260, height: 2190, channels: 4, background: '#1E1E1E' } }).composite(gallery).png().toFile(path.join(root, 'design/preview/all-screens.png'));
  await sharp({ create: { width: 2320, height: 2130, channels: 4, background: '#eeeeee' } }).composite(comparison).png().toFile(path.join(root, 'design/comparison.png'));
})().catch(error => { console.error(error); process.exitCode = 1; });
