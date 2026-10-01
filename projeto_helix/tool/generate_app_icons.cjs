#!/usr/bin/env node
// Usage: node tool/generate_app_icons.cjs
// Requires sharp (or set NODE_PATH to a directory containing sharp).
// The original Figma SVG is the single source for every launcher image.
const fs = require('node:fs/promises');
const path = require('node:path');
const sharp = require('sharp');

const root = path.resolve(__dirname, '..');
const source = path.join(root, 'assets/branding/logo.svg');
const generated = [];

async function png(size) {
  return sharp(source, { density: 768 })
    .resize(size, size)
    .flatten({ background: '#ffffff' })
    .removeAlpha()
    .png()
    .toBuffer();
}

async function write(relativePath, data) {
  const destination = path.join(root, relativePath);
  await fs.mkdir(path.dirname(destination), { recursive: true });
  await fs.writeFile(destination, data);
  generated.push(relativePath);
}

async function writePng(relativePath, size) {
  await write(relativePath, await png(size));
}

async function appleIcons(relativeDirectory) {
  const catalog = JSON.parse(await fs.readFile(
    path.join(root, relativeDirectory, 'Contents.json'), 'utf8'));
  const seen = new Set();
  for (const item of catalog.images) {
    if (!item.filename || seen.has(item.filename)) continue;
    seen.add(item.filename);
    const size = Math.round(parseFloat(item.size) * parseFloat(item.scale));
    await writePng(`${relativeDirectory}/${item.filename}`, size);
  }
}

async function windowsIcon() {
  const sizes = [16, 24, 32, 48, 64, 128, 256];
  const images = await Promise.all(sizes.map(png));
  const header = Buffer.alloc(6 + 16 * images.length);
  header.writeUInt16LE(1, 2); // ICO image type.
  header.writeUInt16LE(images.length, 4);
  let offset = header.length;
  images.forEach((image, i) => {
    const entry = 6 + 16 * i;
    header[entry] = sizes[i] === 256 ? 0 : sizes[i];
    header[entry + 1] = sizes[i] === 256 ? 0 : sizes[i];
    header.writeUInt16LE(1, entry + 4);
    header.writeUInt16LE(24, entry + 6);
    header.writeUInt32LE(image.length, entry + 8);
    header.writeUInt32LE(offset, entry + 12);
    offset += image.length;
  });
  await write('windows/runner/resources/app_icon.ico',
    Buffer.concat([header, ...images]));
}

async function main() {
  await writePng('assets/branding/logo.png', 1024);
  for (const [density, size] of Object.entries({
    mdpi: 48, hdpi: 72, xhdpi: 96, xxhdpi: 144, xxxhdpi: 192,
  })) {
    await writePng(`android/app/src/main/res/mipmap-${density}/ic_launcher.png`, size);
  }
  await appleIcons('ios/Runner/Assets.xcassets/AppIcon.appiconset');
  await appleIcons('macos/Runner/Assets.xcassets/AppIcon.appiconset');
  for (const size of [192, 512]) {
    await writePng(`web/icons/Icon-${size}.png`, size);
    // A maskable icon needs the complete artwork within its central safe circle.
    const insetLogo = await png(Math.floor(size * 0.56));
    const maskable = await sharp({ create: {
      width: size, height: size, channels: 3, background: '#ffffff',
    } }).composite([{ input: insetLogo, gravity: 'centre' }]).png().toBuffer();
    await write(`web/icons/Icon-maskable-${size}.png`, maskable);
  }
  await writePng('web/favicon.png', 48);
  await windowsIcon();
  console.log(`Generated ${generated.length} icon files from assets/branding/logo.svg.`);
}

main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
