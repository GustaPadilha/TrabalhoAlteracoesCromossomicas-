# Geradores dos assets Helix

Os scripts são opcionais: imagens, fontes, ícones e prévias já estão no projeto.
Todos os caminhos são relativos ao projeto. Os originais estão em `design/Helix.svg`
e `assets/branding/logo.svg`.

Para regenerar imagens com Node.js, instale a dependência de desenvolvimento:

```sh
cd tool
npm install
cd ..
node tool/generate_app_icons.cjs
node tool/extract_reference.cjs
node tool/contact_sheet.cjs
```

Também é possível definir `NODE_PATH` para uma instalação existente de `sharp`.

`python tool/extract_auth_assets.py` usa a biblioteca padrão do Python e o Node
com `sharp` para extrair somente ilustração, marca e símbolos sociais, sem
transformar as telas completas em imagens. `python tool/extract_dashboard_vectors.py`
recria os paths Flutter do perfil e dos ícones a partir do SVG; execute
`dart format lib/widgets/design_vectors.dart` em seguida.

`flutter test tool/render_screens_test.dart` gera as 12 prévias de widgets em
`design/preview/`. Rode `node tool/contact_sheet.cjs` depois para atualizar o
painel `all-screens.png` e a comparação com a referência (original à esquerda,
Flutter à direita de cada par).

O gerador de ícones preserva fundo, cores e sombra do logo. As dimensões Apple
vêm dos catálogos `Contents.json`. O arquivo ICO inclui sete resoluções de
16 a 256 px. Os ícones web `maskable` incluem margem para as máscaras do sistema.
O projeto Linux original não possui configuração de ícone de distribuição.
