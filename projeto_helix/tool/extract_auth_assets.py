"""Extract individual original Figma illustrations, keeping native Flutter UI."""

from copy import deepcopy
from pathlib import Path
import subprocess
import re
import shutil
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'design' / 'Helix.svg'
ET.register_namespace("", "http://www.w3.org/2000/svg")
ET.register_namespace("xlink", "http://www.w3.org/1999/xlink")
source = ET.parse(SOURCE).getroot()


def extract(name, group, indices, bounds):
    x, y, width, height = bounds
    root = ET.Element("{http://www.w3.org/2000/svg}svg", {
        "width": str(width * 4), "height": str(height * 4),
        "viewBox": f"{x} {y} {width} {height}", "fill": "none",
    })
    for index in indices:
        root.append(deepcopy(source[group][index]))
    # Keep only referenced definitions, not every embedded image in the sheet.
    definitions = {node.get('id'): node for node in source[-1]}
    needed = set()
    def references(node):
        text = ET.tostring(node, encoding='unicode')
        return set(re.findall(r'url\(#([^)]*)\)', text) +
                   re.findall(r'href="\#([^"]*)"', text))
    pending = references(root)
    while pending:
        identifier = pending.pop()
        if identifier in needed or identifier not in definitions:
            continue
        needed.add(identifier)
        pending |= references(definitions[identifier]) - needed
    if needed:
        defs = ET.SubElement(root, '{http://www.w3.org/2000/svg}defs')
        for identifier, node in definitions.items():
            if identifier in needed:
                defs.append(deepcopy(node))
    path = ROOT / "assets" / "images" / f"{name}.svg"
    ET.ElementTree(root).write(path, encoding="unicode")
    subprocess.run([
        shutil.which('node') or 'node', "-e",
        "const sharp=require(process.argv[1]); sharp(process.argv[2]).png().toFile(process.argv[3]);",
        'sharp', str(path), str(path.with_suffix(".png")),
    ], check=True, cwd=ROOT / 'tool')


extract("welcome_wordmark", 4, range(1, 7), (330, 1154, 152, 75))
extract("welcome_illustration", 4, [*range(7, 12), *range(17, 39)], (320, 1230, 283, 270))
extract("google_mark", 5, [7], (688, 1474.52, 20, 20))
extract("apple_mark", 5, [10], (808, 1472.52, 20.2105, 24))
