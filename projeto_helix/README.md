# Helix — telas em Flutter

Reprodução das 12 pranchetas do arquivo `design/Helix.svg`. As telas usam widgets Flutter: textos, campos, botões, cartões e formas vetoriais. A ilustração, a marca e os símbolos de login foram extraídos do SVG original. Os controles estão sem ações, navegação ou transições.

## Executar

```sh
flutter pub get
flutter run
```

A primeira tela é a de apresentação. Para abrir qualquer outra sem configurar navegação:

```sh
flutter run --dart-define=HELIX_SCREEN=login
```

| HELIX_SCREEN | Tela |
| --- | --- |
| welcome | Apresentação |
| register | Cadastro |
| login | Login |
| home | Início |
| profile | Perfil |
| concepts | Conceitos, com o primeiro item expandido |
| videos | Recursos extras: vídeos |
| sites | Recursos extras: sites |
| flashcard | Cartão de estudo |
| flashcards | Categorias de cartões |
| alterations | Explorar alterações |
| detail | Detalhe vazio, como no SVG |

O VS Code também tem uma configuração de execução para cada tela em `.vscode/launch.json`. Ao alterar `HELIX_SCREEN`, reinicie a execução (hot reload não atualiza constantes de compilação).

## Layout e conteúdo

As medidas originais de 283×540 e 283×680 são mantidas em coordenadas lógicas e escaladas proporcionalmente à largura. Telas altas rolam em dispositivos menores; em desktop, o conteúdo mantém uma largura de telefone. O layout respeita a área segura do sistema. Os textos “Lorem ipsum”, o avatar preto e os blocos cinza são intencionais e já constam do desenho fornecido.

Componentes comuns estão em `lib/widgets/helix_ui.dart`; telas em `lib/screens/`. As curvas do perfil e dos cartões são desenhadas por `CustomPainter`. As fontes são locais: Lilita One nos títulos e Poppins nos demais textos. O SVG não informa os nomes das fontes; a fonte dos textos menores deve ser confirmada com o arquivo Figma para correspondência exata.

## Ícone

O ícone fornecido está aplicado em Android, iOS, macOS, Windows e web. A fonte original está em `assets/branding/logo.svg`; o script de regeneração está documentado em `tool/README.md`. O template Linux não define um ícone de distribuição.

## Validação e prévias

```sh
flutter analyze
flutter test
flutter test tool/render_screens_test.dart
flutter build web
```

O teste de widgets percorre todas as telas nos tamanhos 283×540, 320×568 e 393×852 e verifica que os controles não disparam ações. O renderizador salva as 12 prévias em `design/preview/`. As imagens originais para comparação ficam em `design/reference/`.
