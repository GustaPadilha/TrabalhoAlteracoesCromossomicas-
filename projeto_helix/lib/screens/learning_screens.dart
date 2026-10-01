import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/helix_ui.dart';

/// Static study screens transcribed from the supplied Figma SVG.
/// Coordinates and text baselines use the original 283 px design width.
class ConceptsScreen extends StatelessWidget {
  const ConceptsScreen({super.key});

  @override
  Widget build(BuildContext context) => HelixCanvas(
    height: 680,
    children: [
      const Positioned(
        left: 0,
        top: 0,
        width: 283,
        height: 153,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
      ),
      const Positioned(
        left: 0,
        top: -23,
        width: 283,
        height: 153,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.darkBlue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
      ),
      const _StudyBack(),
      const _TextAt(
        x: 15,
        baseline: 73,
        width: 255,
        text: 'Explore os conceitos\nessenciais primeiro.',
        color: HelixColors.cream,
      ),
      const Positioned(
        left: 28,
        top: 197,
        width: 228,
        height: 174,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.mediumBlue,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(8),
            ),
          ),
        ),
      ),
      const _TextAt(
        x: 40,
        baseline: 260.275,
        width: 209,
        text:
            'Lorem ipsum dolor sit amet\n'
            'consectetur. Lectus mattis vitae a\n'
            'placerat ornare. Auctor pellentesque\n'
            'duis laoreet pellentesque porttitor\n'
            'scelerisque. Pretium non ornare\n'
            'urna phasellus ut nibh. Adipiscing\n'
            'hendrerit ac duis dolor molestie nisl\n'
            'et proin.',
        color: HelixColors.cream,
        display: false,
        size: 11,
        lineHeight: 14,
      ),
      const Positioned(
        left: 28,
        top: 197,
        width: 228,
        height: 48,
        child: _ConceptHeading(expanded: true),
      ),
      for (final y in [391.0, 459.0, 527.0, 595.0])
        Positioned(
          left: y == 595 ? 27 : 28,
          top: y,
          width: 228,
          height: 48,
          child: const _ConceptHeading(),
        ),
    ],
  );
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) => const _ResourcesScreen(sites: false);
}

class SitesScreen extends StatelessWidget {
  const SitesScreen({super.key});

  @override
  Widget build(BuildContext context) => const _ResourcesScreen(sites: true);
}

class _ResourcesScreen extends StatelessWidget {
  const _ResourcesScreen({required this.sites});

  final bool sites;

  @override
  Widget build(BuildContext context) => HelixCanvas(
    background: HelixColors.blue,
    children: [
      const Positioned.fill(child: ColoredBox(color: HelixColors.cream)),
      const _StudyBack(),
      const _TextAt(
        x: 40,
        baseline: 51,
        width: 202,
        text: 'Explore mais além do\nque o app oferece.',
        align: TextAlign.center,
      ),
      const Positioned(
        left: 0,
        top: 121,
        width: 283,
        height: 419,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
          ),
        ),
      ),
      Positioned(
        left: 31,
        top: 134,
        width: 220,
        height: 28,
        child: _ResourceTabs(sites: sites),
      ),
      if (sites)
        for (final y in [195.0, 273.0, 351.0, 429.0])
          Positioned(
            left: 16,
            top: y,
            width: 252,
            height: 56,
            child: const _PatternCard(description: true),
          )
      else
        for (final offset in const [
          Offset(31, 200),
          Offset(155, 200),
          Offset(31, 316),
          Offset(155, 316),
          Offset(27, 432),
          Offset(155, 432),
        ])
          Positioned(
            left: offset.dx,
            top: offset.dy,
            width: 96,
            height: 96,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
    ],
  );
}

class FlashcardScreen extends StatelessWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context) => HelixCanvas(
    children: [
      const _StudyBack(),
      const _TextAt(x: 54, baseline: 32, width: 200, text: 'Lorem ipsum'),
      Positioned(
        left: 50.56,
        top: 81.491,
        width: 192,
        height: 192,
        child: Transform.rotate(
          angle: 6 * math.pi / 180,
          alignment: Alignment.topLeft,
          child: const _FlashcardPaper(color: HelixColors.darkBlue),
        ),
      ),
      Positioned(
        left: 22.14,
        top: 113.057,
        width: 192,
        height: 192,
        child: Transform.rotate(
          angle: -12 * math.pi / 180,
          alignment: Alignment.topLeft,
          child: const _FlashcardPaper(color: HelixColors.blue),
        ),
      ),
      const Positioned(
        left: 40,
        top: 91,
        width: 192,
        height: 192,
        child: _FlashcardPaper(color: HelixColors.mediumBlue),
      ),
      const _TextAt(
        x: 45,
        baseline: 133,
        width: 188,
        text: 'Lorem ipsum nulla\nvitae magna faucibus.',
        color: Colors.white,
      ),
      const Positioned(
        left: 47,
        top: 171,
        width: 16,
        height: 16,
        child: CustomPaint(painter: _FlipIconPainter()),
      ),
      const _TextAt(
        x: 68,
        baseline: 182.3,
        width: 167,
        text: 'Toque para ver a resposta.',
        display: false,
        size: 12,
      ),
      const Positioned(
        left: 36,
        top: 312,
        width: 212,
        height: 43,
        child: HelixButton(label: 'Lembrei', fontSize: 20),
      ),
      const Positioned(
        left: 36,
        top: 374,
        width: 212,
        height: 43,
        child: HelixButton(label: 'Não lembrei', fontSize: 20),
      ),
    ],
  );
}

class FlashcardsScreen extends StatelessWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) => HelixCanvas(
    children: [
      const _StudyBack(),
      const _TextAt(
        x: 39,
        baseline: 51,
        width: 231,
        text: 'Cartões curtos pra fixar\no que você aprendeu.',
      ),
      for (var i = 0; i < 6; i++)
        Positioned(
          left: 15,
          top: 121 + i * 72,
          width: 250,
          height: 48,
          child: _FlashcardCategory(
            reversed: i.isOdd,
            completed: i == 2 || i == 3,
            textOffset: i == 4
                ? 2
                : i == 3
                ? 2
                : i == 5
                ? 1
                : 0,
            last: i == 5,
          ),
        ),
    ],
  );
}

class AlterationsScreen extends StatelessWidget {
  const AlterationsScreen({super.key});

  @override
  Widget build(BuildContext context) => HelixCanvas(
    height: 680,
    children: [
      const Positioned(
        left: 0,
        top: 0,
        width: 283,
        height: 184,
        child: CustomPaint(painter: _AlterationsHeaderPainter()),
      ),
      const _StudyBack(),
      const _TextAt(
        x: 15,
        baseline: 68,
        width: 255,
        text: 'Explore o conteúdo e\nescolha por onde começar.',
        color: HelixColors.cream,
      ),
      for (var i = 0; i < 6; i++)
        Positioned(
          left: i == 4 ? 15 : 16,
          top: 195 + i * 71,
          width: 252,
          height: 56,
          child: const _PatternCard(),
        ),
    ],
  );
}

/// The provided detail artboard contains only its background and back arrow.
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const HelixCanvas(children: [_StudyBack()]);
}

class _StudyBack extends StatelessWidget {
  const _StudyBack();

  @override
  Widget build(BuildContext context) => const Positioned(
    left: 10,
    top: 15,
    width: 24,
    height: 24,
    child: HelixBackButton(color: Colors.black),
  );
}

/// Baseline placement preserves Figma's typography independent of font ascent.
class _TextAt extends StatelessWidget {
  const _TextAt({
    required this.x,
    required this.baseline,
    required this.width,
    required this.text,
    this.size = 20,
    this.color = HelixColors.ink,
    this.display = true,
    this.lineHeight,
    this.align = TextAlign.left,
  });

  final double x;
  final double baseline;
  final double width;
  final String text;
  final double size;
  final Color color;
  final bool display;
  final double? lineHeight;
  final TextAlign align;

  @override
  Widget build(BuildContext context) => Positioned(
    left: x,
    top: baseline,
    width: width,
    child: Baseline(
      baseline: 0,
      baselineType: TextBaseline.alphabetic,
      child: SizedBox(
        width: width,
        child: HelixText(
          text,
          size: size,
          color: color,
          display: display,
          height: (lineHeight ?? size * 1.15) / size,
          align: align,
        ),
      ),
    ),
  );
}

class _ConceptHeading extends StatelessWidget {
  const _ConceptHeading({this.expanded = false});

  final bool expanded;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFF7FAEC7),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: HelixColors.blue,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
        const _TextAt(x: 15, baseline: 31.5, width: 175, text: 'Lorem ipsum'),
        Positioned(
          left: 193.63,
          top: expanded ? 19.55 : 21.09,
          width: 12.74,
          height: 7.36,
          child: CustomPaint(painter: _ChevronPainter(expanded: expanded)),
        ),
      ],
    ),
  );
}

class _ResourceTabs extends StatelessWidget {
  const _ResourceTabs({required this.sites});

  final bool sites;

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.cream.withValues(alpha: .72),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      Positioned(
        left: sites ? 110 : 0,
        top: 0,
        width: 110,
        height: 28,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HelixColors.cream.withValues(alpha: .72),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      _TextAt(
        x: 0,
        baseline: 20,
        width: 110,
        text: 'Videos',
        size: 16,
        align: TextAlign.center,
        color: HelixColors.ink.withValues(alpha: sites ? .72 : 1),
      ),
      _TextAt(
        x: 110,
        baseline: 20,
        width: 110,
        text: 'Sites',
        size: 16,
        align: TextAlign.center,
        color: HelixColors.ink.withValues(alpha: sites ? 1 : .72),
      ),
    ],
  );
}

class _FlashcardPaper extends StatelessWidget {
  const _FlashcardPaper({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
  );
}

class _FlashcardCategory extends StatelessWidget {
  const _FlashcardCategory({
    required this.reversed,
    required this.completed,
    required this.textOffset,
    required this.last,
  });

  final bool reversed;
  final bool completed;
  final double textOffset;
  final bool last;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: reversed ? 114 : 0,
          top: 0,
          width: 136,
          height: 48,
          child: const _FlashcardPaper(color: HelixColors.mediumBlue),
        ),
        Positioned.fill(
          child: _FlashcardPaper(
            color: HelixColors.mediumBlue.withValues(alpha: .7),
          ),
        ),
        Positioned(
          left: reversed ? 48 : 162,
          top: 4,
          width: 40,
          height: 40,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HelixColors.darkBlue,
            ),
          ),
        ),
        _TextAt(
          x: reversed ? (last ? 126 : 128) : 12,
          baseline: 31 + textOffset,
          width: 124,
          text: 'Lorem ipsum',
          color: HelixColors.ink.withValues(alpha: completed ? .7 : 1),
        ),
        if (completed)
          Positioned(
            left: reversed ? 53.43 : 167.43,
            top: 3.18,
            width: 44.14,
            height: 32.57,
            child: const CustomPaint(painter: _CheckPainter()),
          ),
      ],
    ),
  );
}

class _PatternCard extends StatelessWidget {
  const _PatternCard({this.description = false});

  final bool description;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    enabled: false,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: CustomPaint(painter: _CardPatternPainter()),
          ),
        ),
        _TextAt(
          x: 15,
          baseline: description ? 32.5 : 35,
          width: 137,
          text: 'Lorem ipsum',
        ),
        if (description) ...[
          const _TextAt(
            x: 159,
            baseline: 15.275,
            width: 91,
            text: 'Lorem ipsum\nviverra eget\nnon quisque.',
            size: 11,
            lineHeight: 14,
            display: false,
            color: HelixColors.cream,
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(color: HelixColors.ink, width: .5),
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}

class _ChevronPainter extends CustomPainter {
  const _ChevronPainter({required this.expanded});

  final bool expanded;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(.71, 0)
      ..lineTo(6.37, 5.657)
      ..lineTo(12.03, 0)
      ..lineTo(13.44, 1.414)
      ..lineTo(7.78, 7.071)
      ..quadraticBezierTo(7.07, 7.66, 6.36, 7.071)
      ..lineTo(.70, 1.414)
      ..close();
    canvas.save();
    canvas.translate(-.70, 0);
    if (expanded) {
      canvas.translate(0, 7.36);
      canvas.scale(1, -1);
    }
    canvas.drawPath(path, Paint()..color = Colors.black);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ChevronPainter oldDelegate) =>
      oldDelegate.expanded != expanded;
}

class _CheckPainter extends CustomPainter {
  const _CheckPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(15.43, 32.57)
      ..lineTo(0, 17.13)
      ..lineTo(3.86, 13.27)
      ..lineTo(15.43, 24.85)
      ..lineTo(40.28, 0)
      ..lineTo(44.14, 3.86)
      ..close();
    canvas.drawPath(path, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(_CheckPainter oldDelegate) => false;
}

class _FlipIconPainter extends CustomPainter {
  const _FlipIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(3.45, 4.119)
      ..cubicTo(4.55, 2.828, 6.17, 2, 8, 2)
      ..cubicTo(11.32, 2, 14, 4.684, 14, 8)
      ..lineTo(16, 8)
      ..cubicTo(16, 3.581, 12.42, 0, 8, 0)
      ..cubicTo(5.62, 0, 3.49, 1.044, 2.03, 2.694)
      ..lineTo(0, .666)
      ..lineTo(0, 6)
      ..lineTo(5.33, 6)
      ..close()
      ..moveTo(12.55, 11.881)
      ..cubicTo(11.45, 13.172, 9.83, 14, 8, 14)
      ..cubicTo(4.68, 14, 2, 11.316, 2, 8)
      ..lineTo(0, 8)
      ..cubicTo(0, 12.419, 3.58, 16, 8, 16)
      ..cubicTo(10.38, 16, 12.51, 14.956, 13.97, 13.306)
      ..lineTo(16, 15.334)
      ..lineTo(16, 10)
      ..lineTo(10.67, 10)
      ..close();
    canvas.drawPath(path, Paint()..color = HelixColors.ink);
  }

  @override
  bool shouldRepaint(_FlipIconPainter oldDelegate) => false;
}

class _CardPatternPainter extends CustomPainter {
  const _CardPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = HelixColors.mediumBlue,
    );
    canvas.drawPath(_cardLightPath, Paint()..color = const Color(0xCC7FAEC7));
    canvas.drawPath(_cardDarkPath, Paint()..color = const Color(0x66285B83));
  }

  @override
  bool shouldRepaint(_CardPatternPainter oldDelegate) => false;
}

class _AlterationsHeaderPainter extends CustomPainter {
  const _AlterationsHeaderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(_headerBluePath, Paint()..color = HelixColors.blue);
    canvas.drawPath(_headerDarkPath, Paint()..color = HelixColors.darkBlue);
  }

  @override
  bool shouldRepaint(_AlterationsHeaderPainter oldDelegate) => false;
}

// Decorative contours preserve the exact Bezier paths from Helix.svg.
final Path _headerBluePath = Path()
  ..fillType = PathFillType.evenOdd
  ..moveTo(-93.82, -117.1)
  ..cubicTo(-90.08, -119.14, -86.53, -121.25, -83.15, -123.43)
  ..cubicTo(-79.77, -125.6, -76.47, -127.77, -73.23, -129.92)
  ..cubicTo(-70.11, -132.12, -66.92, -134.18, -63.63, -136.1)
  ..cubicTo(-60.47, -138.06, -57.18, -139.83, -53.75, -141.4)
  ..cubicTo(-50.33, -142.98, -46.74, -144.27, -42.98, -145.28)
  ..cubicTo(-39.23, -146.29, -35.2, -146.95, -30.9, -147.24)
  ..cubicTo(-26.59, -147.54, -21.91, -147.41, -16.85, -146.84)
  ..cubicTo(-11.89, -146.38, -6.64, -145.59, -1.1, -144.48)
  ..cubicTo(4.31, -143.42, 9.99, -142.14, 15.93, -140.66)
  ..cubicTo(21.89, -139.25, 28.01, -137.7, 34.28, -136.03)
  ..cubicTo(40.55, -134.35, 46.9, -132.72, 53.34, -131.13)
  ..cubicTo(59.78, -129.53, 66.32, -128.05, 72.97, -126.67)
  ..cubicTo(79.48, -125.27, 86.01, -124.12, 92.57, -123.21)
  ..cubicTo(99.1, -122.24, 105.58, -121.47, 111.99, -120.91)
  ..cubicTo(118.55, -120.37, 125, -119.91, 131.34, -119.52)
  ..cubicTo(137.69, -119.13, 143.91, -118.78, 150.02, -118.48)
  ..cubicTo(156.22, -118.07, 162.34, -117.62, 168.37, -117.13)
  ..cubicTo(174.39, -116.57, 180.27, -115.84, 186.01, -114.95)
  ..cubicTo(191.76, -114.05, 197.35, -112.88, 202.76, -111.45)
  ..cubicTo(208.18, -110.02, 213.46, -108.24, 218.61, -106.1)
  ..cubicTo(223.77, -103.97, 228.74, -101.53, 233.54, -98.8)
  ..cubicTo(238.33, -96.06, 242.89, -93.05, 247.21, -89.77)
  ..cubicTo(251.43, -86.59, 255.44, -83.2, 259.24, -79.6)
  ..cubicTo(262.92, -76.04, 266.35, -72.35, 269.52, -68.54)
  ..cubicTo(272.68, -64.67, 275.49, -60.77, 277.95, -56.86)
  ..cubicTo(280.42, -52.95, 282.48, -49.05, 284.14, -45.14)
  ..cubicTo(285.79, -41.24, 287.13, -37.39, 288.15, -33.58)
  ..cubicTo(289.04, -29.81, 289.75, -26.08, 290.27, -22.38)
  ..cubicTo(290.88, -18.58, 291.33, -14.87, 291.61, -11.26)
  ..cubicTo(292, -7.61, 292.43, -4.02, 292.87, -0.5)
  ..cubicTo(293.29, 3.09, 293.87, 6.63, 294.6, 10.11)
  ..cubicTo(295.45, 13.64, 296.57, 17.16, 297.97, 20.68)
  ..cubicTo(299.39, 24.13, 301.28, 27.6, 303.62, 31.1)
  ..cubicTo(305.87, 34.5, 308.53, 37.89, 311.59, 41.3)
  ..cubicTo(314.65, 44.7, 317.92, 48.07, 321.41, 51.41)
  ..cubicTo(324.78, 54.71, 328.17, 57.94, 331.59, 61.11)
  ..cubicTo(335.15, 64.26, 338.41, 67.3, 341.38, 70.23)
  ..cubicTo(344.46, 73.2, 347.19, 76.04, 349.56, 78.75)
  ..cubicTo(351.91, 81.52, 353.65, 84.11, 354.79, 86.5)
  ..cubicTo(356.05, 88.94, 356.62, 91.2, 356.53, 93.28)
  ..cubicTo(356.29, 95.38, 355.55, 97.37, 354.31, 99.24)
  ..cubicTo(352.95, 101.08, 351.2, 102.87, 349.06, 104.63)
  ..cubicTo(346.94, 106.32, 344.55, 108.03, 341.89, 109.74)
  ..cubicTo(339.22, 111.45, 336.49, 113.17, 333.68, 114.9)
  ..cubicTo(330.85, 116.69, 328.07, 118.54, 325.33, 120.44)
  ..cubicTo(322.69, 122.45, 320.23, 124.53, 317.94, 126.67)
  ..cubicTo(315.75, 128.93, 313.86, 131.29, 312.27, 133.76)
  ..cubicTo(310.65, 136.3, 309.2, 138.9, 307.94, 141.57)
  ..cubicTo(306.68, 144.24, 305.54, 146.92, 304.54, 149.61)
  ..cubicTo(303.42, 152.26, 302.31, 154.88, 301.22, 157.47)
  ..cubicTo(300.12, 160.05, 298.87, 162.51, 297.46, 164.83)
  ..cubicTo(296.03, 167.22, 294.35, 169.37, 292.43, 171.28)
  ..cubicTo(290.5, 173.19, 288.25, 174.87, 285.68, 176.33)
  ..cubicTo(282.99, 177.74, 280, 178.89, 276.69, 179.77)
  ..cubicTo(273.37, 180.73, 269.74, 181.39, 265.82, 181.75)
  ..cubicTo(261.9, 182.12, 257.73, 182.25, 253.31, 182.13)
  ..cubicTo(248.89, 182.02, 244.34, 181.72, 239.66, 181.22)
  ..cubicTo(234.98, 180.72, 230.18, 179.99, 225.26, 179.04)
  ..cubicTo(220.34, 178.08, 215.36, 176.96, 210.3, 175.66)
  ..cubicTo(205.36, 174.41, 200.36, 172.95, 195.3, 171.28)
  ..cubicTo(190.33, 169.73, 185.35, 168.06, 180.34, 166.26)
  ..cubicTo(175.35, 164.41, 170.35, 162.59, 165.34, 160.79)
  ..cubicTo(160.23, 158.89, 155.1, 157.06, 149.95, 155.29)
  ..cubicTo(144.68, 153.47, 139.29, 151.79, 133.78, 150.25)
  ..cubicTo(128.41, 148.7, 122.85, 147.28, 117.1, 146.02)
  ..cubicTo(111.47, 144.8, 105.63, 143.8, 99.57, 143)
  ..cubicTo(93.49, 142.27, 87.26, 141.75, 80.89, 141.42)
  ..cubicTo(74.53, 141.1, 68.1, 140.93, 61.61, 140.93)
  ..cubicTo(55.13, 140.92, 48.7, 140.94, 42.33, 140.98)
  ..cubicTo(35.98, 140.96, 29.79, 140.88, 23.76, 140.75)
  ..cubicTo(17.72, 140.63, 11.97, 140.27, 6.51, 139.7)
  ..cubicTo(1.02, 139.19, -4.15, 138.37, -8.99, 137.22)
  ..cubicTo(-13.69, 136.05, -17.91, 134.49, -21.64, 132.51)
  ..cubicTo(-25.39, 130.61, -28.77, 128.25, -31.78, 125.45)
  ..cubicTo(-34.7, 122.76, -37.36, 119.73, -39.75, 116.36)
  ..cubicTo(-42.15, 112.98, -44.45, 109.35, -46.65, 105.47)
  ..cubicTo(-48.76, 101.69, -50.94, 97.74, -53.19, 93.61)
  ..cubicTo(-55.44, 89.49, -57.93, 85.28, -60.66, 80.98)
  ..cubicTo(-63.26, 76.72, -66.22, 72.49, -69.51, 68.27)
  ..cubicTo(-72.81, 64.05, -76.6, 59.9, -80.9, 55.82)
  ..cubicTo(-85.05, 51.72, -89.58, 47.73, -94.5, 43.86)
  ..cubicTo(-99.41, 39.98, -104.53, 36.14, -109.88, 32.33)
  ..cubicTo(-115.1, 28.56, -120.46, 24.81, -125.97, 21.09)
  ..cubicTo(-131.36, 17.4, -136.67, 13.71, -141.92, 10)
  ..cubicTo(-147.05, 6.34, -151.97, 2.69, -156.69, -0.97)
  ..cubicTo(-161.42, -4.63, -165.78, -8.33, -169.79, -12.09)
  ..cubicTo(-173.71, -15.73, -177.12, -19.45, -180.04, -23.24)
  ..cubicTo(-182.98, -26.96, -185.46, -30.66, -187.47, -34.33)
  ..cubicTo(-189.46, -38.06, -191, -41.73, -192.09, -45.35)
  ..cubicTo(-193.08, -48.86, -193.56, -52.29, -193.54, -55.64)
  ..cubicTo(-193.62, -59.03, -193.23, -62.28, -192.34, -65.38)
  ..cubicTo(-191.34, -68.44, -189.92, -71.34, -188.09, -74.09)
  ..cubicTo(-186.25, -76.84, -183.91, -79.33, -181.06, -81.55)
  ..cubicTo(-178.18, -83.84, -174.97, -85.93, -171.42, -87.82)
  ..cubicTo(-167.74, -89.74, -163.84, -91.5, -159.72, -93.11)
  ..cubicTo(-155.47, -94.74, -151.1, -96.29, -146.63, -97.76)
  ..cubicTo(-142.05, -99.2, -137.46, -100.63, -132.87, -102.06)
  ..cubicTo(-128.14, -103.51, -123.53, -105.01, -119.03, -106.55)
  ..cubicTo(-114.42, -108.05, -110.03, -109.66, -105.87, -111.4)
  ..cubicTo(-101.57, -113.16, -97.55, -115.06, -93.82, -117.1)
  ..close();

final Path _headerDarkPath = Path()
  ..fillType = PathFillType.evenOdd
  ..moveTo(-93.39, -145.55)
  ..cubicTo(-89.65, -147.59, -86.1, -149.7, -82.72, -151.88)
  ..cubicTo(-79.34, -154.05, -76.04, -156.22, -72.8, -158.37)
  ..cubicTo(-69.68, -160.57, -66.48, -162.63, -63.2, -164.55)
  ..cubicTo(-60.04, -166.51, -56.75, -168.28, -53.32, -169.85)
  ..cubicTo(-49.9, -171.43, -46.31, -172.72, -42.55, -173.73)
  ..cubicTo(-38.79, -174.74, -34.77, -175.4, -30.46, -175.69)
  ..cubicTo(-26.16, -175.99, -21.48, -175.86, -16.42, -175.29)
  ..cubicTo(-11.46, -174.83, -6.21, -174.04, -0.67, -172.93)
  ..cubicTo(4.74, -171.87, 10.42, -170.59, 16.36, -169.11)
  ..cubicTo(22.32, -167.7, 28.44, -166.15, 34.71, -164.48)
  ..cubicTo(40.98, -162.8, 47.33, -161.17, 53.77, -159.58)
  ..cubicTo(60.21, -157.98, 66.75, -156.5, 73.4, -155.12)
  ..cubicTo(79.91, -153.72, 86.44, -152.57, 93, -151.66)
  ..cubicTo(99.53, -150.69, 106.01, -149.92, 112.42, -149.36)
  ..cubicTo(118.98, -148.82, 125.43, -148.36, 131.78, -147.97)
  ..cubicTo(138.12, -147.58, 144.34, -147.23, 150.45, -146.93)
  ..cubicTo(156.65, -146.52, 162.77, -146.07, 168.8, -145.58)
  ..cubicTo(174.82, -145.02, 180.7, -144.29, 186.44, -143.4)
  ..cubicTo(192.19, -142.5, 197.78, -141.33, 203.19, -139.9)
  ..cubicTo(208.61, -138.47, 213.89, -136.69, 219.04, -134.55)
  ..cubicTo(224.2, -132.42, 229.17, -129.98, 233.97, -127.25)
  ..cubicTo(238.76, -124.51, 243.32, -121.5, 247.64, -118.22)
  ..cubicTo(251.87, -115.04, 255.88, -111.65, 259.67, -108.05)
  ..cubicTo(263.35, -104.49, 266.78, -100.8, 269.96, -96.99)
  ..cubicTo(273.11, -93.12, 275.92, -89.22, 278.38, -85.31)
  ..cubicTo(280.85, -81.4, 282.91, -77.5, 284.57, -73.59)
  ..cubicTo(286.23, -69.69, 287.56, -65.84, 288.58, -62.03)
  ..cubicTo(289.47, -58.26, 290.18, -54.53, 290.7, -50.83)
  ..cubicTo(291.31, -47.03, 291.76, -43.32, 292.04, -39.71)
  ..cubicTo(292.43, -36.06, 292.86, -32.47, 293.3, -28.95)
  ..cubicTo(293.72, -25.36, 294.3, -21.82, 295.03, -18.34)
  ..cubicTo(295.88, -14.81, 297.01, -11.29, 298.4, -7.77)
  ..cubicTo(299.82, -4.33, 301.71, -0.85, 304.05, 2.65)
  ..cubicTo(306.31, 6.05, 308.96, 9.44, 312.02, 12.84)
  ..cubicTo(315.08, 16.25, 318.36, 19.62, 321.84, 22.96)
  ..cubicTo(325.21, 26.26, 328.6, 29.49, 332.02, 32.66)
  ..cubicTo(335.58, 35.81, 338.84, 38.85, 341.81, 41.78)
  ..cubicTo(344.89, 44.75, 347.62, 47.59, 349.99, 50.3)
  ..cubicTo(352.34, 53.07, 354.08, 55.66, 355.22, 58.05)
  ..cubicTo(356.48, 60.49, 357.06, 62.75, 356.96, 64.83)
  ..cubicTo(356.72, 66.93, 355.98, 68.92, 354.74, 70.79)
  ..cubicTo(353.38, 72.62, 351.63, 74.42, 349.49, 76.18)
  ..cubicTo(347.37, 77.87, 344.98, 79.58, 342.32, 81.29)
  ..cubicTo(339.65, 83, 336.92, 84.72, 334.11, 86.45)
  ..cubicTo(331.28, 88.24, 328.5, 90.09, 325.76, 91.99)
  ..cubicTo(323.12, 94, 320.66, 96.08, 318.37, 98.22)
  ..cubicTo(316.19, 100.48, 314.29, 102.84, 312.7, 105.31)
  ..cubicTo(311.08, 107.85, 309.64, 110.45, 308.37, 113.12)
  ..cubicTo(307.11, 115.79, 305.98, 118.47, 304.97, 121.16)
  ..cubicTo(303.85, 123.81, 302.74, 126.43, 301.65, 129.02)
  ..cubicTo(300.55, 131.6, 299.3, 134.06, 297.89, 136.38)
  ..cubicTo(296.46, 138.77, 294.78, 140.92, 292.86, 142.83)
  ..cubicTo(290.93, 144.74, 288.68, 146.42, 286.11, 147.88)
  ..cubicTo(283.42, 149.29, 280.43, 150.44, 277.12, 151.32)
  ..cubicTo(273.8, 152.28, 270.17, 152.94, 266.25, 153.3)
  ..cubicTo(262.33, 153.67, 258.16, 153.8, 253.74, 153.68)
  ..cubicTo(249.32, 153.57, 244.77, 153.27, 240.09, 152.77)
  ..cubicTo(235.41, 152.27, 230.61, 151.54, 225.69, 150.59)
  ..cubicTo(220.78, 149.63, 215.79, 148.51, 210.73, 147.21)
  ..cubicTo(205.79, 145.96, 200.79, 144.5, 195.73, 142.83)
  ..cubicTo(190.76, 141.28, 185.78, 139.61, 180.77, 137.81)
  ..cubicTo(175.78, 135.96, 170.78, 134.14, 165.77, 132.34)
  ..cubicTo(160.66, 130.44, 155.53, 128.61, 150.38, 126.84)
  ..cubicTo(145.11, 125.02, 139.72, 123.34, 134.21, 121.8)
  ..cubicTo(128.84, 120.25, 123.28, 118.83, 117.53, 117.57)
  ..cubicTo(111.9, 116.35, 106.06, 115.35, 100, 114.55)
  ..cubicTo(93.92, 113.82, 87.69, 113.3, 81.33, 112.97)
  ..cubicTo(74.96, 112.65, 68.53, 112.48, 62.04, 112.48)
  ..cubicTo(55.56, 112.47, 49.13, 112.49, 42.76, 112.53)
  ..cubicTo(36.42, 112.51, 30.23, 112.43, 24.19, 112.3)
  ..cubicTo(18.15, 112.17, 12.41, 111.82, 6.94, 111.25)
  ..cubicTo(1.45, 110.74, -3.71, 109.92, -8.56, 108.77)
  ..cubicTo(-13.26, 107.6, -17.48, 106.04, -21.21, 104.06)
  ..cubicTo(-24.96, 102.16, -28.34, 99.8, -31.35, 97)
  ..cubicTo(-34.27, 94.31, -36.93, 91.28, -39.32, 87.9)
  ..cubicTo(-41.72, 84.53, -44.02, 80.9, -46.22, 77.02)
  ..cubicTo(-48.33, 73.24, -50.51, 69.29, -52.76, 65.16)
  ..cubicTo(-55.01, 61.04, -57.5, 56.83, -60.23, 52.53)
  ..cubicTo(-62.83, 48.27, -65.79, 44.04, -69.08, 39.82)
  ..cubicTo(-72.38, 35.6, -76.17, 31.45, -80.47, 27.37)
  ..cubicTo(-84.62, 23.26, -89.15, 19.28, -94.07, 15.41)
  ..cubicTo(-98.98, 11.53, -104.1, 7.69, -109.44, 3.88)
  ..cubicTo(-114.67, 0.11, -120.03, -3.64, -125.54, -7.36)
  ..cubicTo(-130.93, -11.05, -136.24, -14.74, -141.49, -18.45)
  ..cubicTo(-146.62, -22.11, -151.54, -25.76, -156.26, -29.42)
  ..cubicTo(-160.99, -33.08, -165.35, -36.78, -169.36, -40.54)
  ..cubicTo(-173.28, -44.18, -176.69, -47.9, -179.61, -51.69)
  ..cubicTo(-182.55, -55.41, -185.03, -59.11, -187.04, -62.78)
  ..cubicTo(-189.03, -66.51, -190.57, -70.19, -191.66, -73.8)
  ..cubicTo(-192.65, -77.31, -193.13, -80.74, -193.1, -84.09)
  ..cubicTo(-193.19, -87.48, -192.8, -90.73, -191.91, -93.83)
  ..cubicTo(-190.91, -96.89, -189.49, -99.79, -187.66, -102.54)
  ..cubicTo(-185.82, -105.29, -183.48, -107.78, -180.62, -110)
  ..cubicTo(-177.75, -112.29, -174.53, -114.38, -170.99, -116.27)
  ..cubicTo(-167.31, -118.19, -163.41, -119.95, -159.29, -121.56)
  ..cubicTo(-155.04, -123.19, -150.67, -124.74, -146.2, -126.21)
  ..cubicTo(-141.62, -127.65, -137.03, -129.08, -132.44, -130.51)
  ..cubicTo(-127.71, -131.96, -123.1, -133.46, -118.6, -135)
  ..cubicTo(-113.99, -136.5, -109.6, -138.11, -105.44, -139.85)
  ..cubicTo(-101.14, -141.61, -97.12, -143.51, -93.39, -145.55)
  ..close();

final Path _cardLightPath = Path()
  ..fillType = PathFillType.evenOdd
  ..moveTo(206.7, 230.01)
  ..cubicTo(204.77, 231.55, 202.5, 232.85, 199.9, 233.91)
  ..cubicTo(197.3, 234.98, 194.47, 235.81, 191.4, 236.41)
  ..cubicTo(188.27, 237.01, 184.9, 237.48, 181.3, 237.81)
  ..cubicTo(177.77, 238.08, 174.03, 238.21, 170.1, 238.21)
  ..cubicTo(166.23, 238.21, 162.2, 238.18, 158, 238.11)
  ..cubicTo(153.87, 237.98, 149.63, 237.81, 145.3, 237.61)
  ..cubicTo(140.97, 237.41, 136.63, 237.25, 132.3, 237.11)
  ..cubicTo(127.9, 236.91, 123.53, 236.81, 119.2, 236.81)
  ..cubicTo(114.93, 236.75, 110.7, 236.81, 106.5, 237.01)
  ..cubicTo(102.3, 237.21, 98.23, 237.55, 94.3, 238.01)
  ..cubicTo(90.37, 238.48, 86.53, 239.08, 82.8, 239.81)
  ..cubicTo(79.07, 240.48, 75.43, 241.25, 71.9, 242.11)
  ..cubicTo(68.37, 242.98, 64.97, 243.91, 61.7, 244.91)
  ..cubicTo(58.37, 245.85, 55.1, 246.78, 51.9, 247.71)
  ..cubicTo(48.77, 248.65, 45.7, 249.58, 42.7, 250.51)
  ..cubicTo(39.7, 251.38, 36.8, 252.18, 34, 252.91)
  ..cubicTo(31.13, 253.65, 28.33, 254.28, 25.6, 254.81)
  ..cubicTo(22.87, 255.28, 20.2, 255.61, 17.6, 255.81)
  ..cubicTo(14.93, 256.01, 12.33, 256.05, 9.8, 255.91)
  ..cubicTo(7.27, 255.71, 4.8, 255.31, 2.4, 254.71)
  ..cubicTo(-0.07, 254.11, -2.5, 253.31, -4.9, 252.31)
  ..cubicTo(-7.23, 251.31, -9.5, 250.11, -11.7, 248.71)
  ..cubicTo(-13.97, 247.31, -16.17, 245.75, -18.3, 244.01)
  ..cubicTo(-20.37, 242.28, -22.4, 240.41, -24.4, 238.41)
  ..cubicTo(-26.33, 236.41, -28.2, 234.31, -30, 232.11)
  ..cubicTo(-31.73, 229.85, -33.4, 227.48, -35, 225.01)
  ..cubicTo(-36.6, 222.61, -38.07, 220.11, -39.4, 217.51)
  ..cubicTo(-40.73, 214.91, -41.97, 212.25, -43.1, 209.51)
  ..cubicTo(-44.23, 206.78, -45.23, 204.01, -46.1, 201.21)
  ..cubicTo(-46.97, 198.41, -47.7, 195.61, -48.3, 192.81)
  ..cubicTo(-48.9, 189.95, -49.4, 187.08, -49.8, 184.21)
  ..cubicTo(-50.2, 181.35, -50.5, 178.45, -50.7, 175.51)
  ..cubicTo(-50.97, 172.58, -51.17, 169.61, -51.3, 166.61)
  ..cubicTo(-51.37, 163.61, -51.47, 160.58, -51.6, 157.51)
  ..cubicTo(-51.67, 154.45, -51.73, 151.35, -51.8, 148.21)
  ..cubicTo(-51.93, 145.08, -52.07, 141.88, -52.2, 138.61)
  ..cubicTo(-52.4, 135.35, -52.67, 132.05, -53, 128.71)
  ..cubicTo(-53.27, 125.31, -53.67, 121.88, -54.2, 118.41)
  ..cubicTo(-54.73, 114.95, -55.37, 111.41, -56.1, 107.81)
  ..cubicTo(-56.83, 104.21, -57.73, 100.55, -58.8, 96.81)
  ..cubicTo(-59.87, 93.08, -61.03, 89.28, -62.3, 85.41)
  ..cubicTo(-63.5, 81.61, -64.8, 77.75, -66.2, 73.81)
  ..cubicTo(-67.6, 69.95, -69, 66.08, -70.4, 62.21)
  ..cubicTo(-71.87, 58.28, -73.27, 54.38, -74.6, 50.51)
  ..cubicTo(-75.93, 46.65, -77.2, 42.81, -78.4, 39.01)
  ..cubicTo(-79.6, 35.21, -80.67, 31.48, -81.6, 27.81)
  ..cubicTo(-82.53, 24.15, -83.3, 20.55, -83.9, 17.01)
  ..cubicTo(-84.43, 13.48, -84.77, 10.05, -84.9, 6.71)
  ..cubicTo(-85.1, 3.45, -85, 0.25, -84.6, -2.89)
  ..cubicTo(-84.2, -5.95, -83.5, -8.89, -82.5, -11.69)
  ..cubicTo(-81.5, -14.42, -80.2, -17.05, -78.6, -19.59)
  ..cubicTo(-77.07, -22.05, -75.3, -24.35, -73.3, -26.49)
  ..cubicTo(-71.23, -28.62, -69, -30.59, -66.6, -32.39)
  ..cubicTo(-64.13, -34.12, -61.53, -35.69, -58.8, -37.09)
  ..cubicTo(-56.07, -38.49, -53.2, -39.69, -50.2, -40.69)
  ..cubicTo(-47.2, -41.69, -44.1, -42.45, -40.9, -42.99)
  ..cubicTo(-37.77, -43.52, -34.57, -43.85, -31.3, -43.99)
  ..cubicTo(-28.03, -44.05, -24.77, -43.89, -21.5, -43.49)
  ..cubicTo(-18.23, -43.09, -15, -42.45, -11.8, -41.59)
  ..cubicTo(-8.67, -40.72, -5.53, -39.55, -2.4, -38.09)
  ..cubicTo(0.67, -36.69, 3.67, -35.09, 6.6, -33.29)
  ..cubicTo(9.53, -31.42, 12.43, -29.42, 15.3, -27.29)
  ..cubicTo(18.17, -25.15, 21, -22.89, 23.8, -20.49)
  ..cubicTo(26.6, -18.09, 29.4, -15.65, 32.2, -13.19)
  ..cubicTo(35, -10.72, 37.77, -8.25, 40.5, -5.79)
  ..cubicTo(43.3, -3.25, 46.1, -0.79, 48.9, 1.61)
  ..cubicTo(51.7, 3.95, 54.53, 6.21, 57.4, 8.41)
  ..cubicTo(60.27, 10.61, 63.17, 12.65, 66.1, 14.51)
  ..cubicTo(69.03, 16.38, 72, 18.05, 75, 19.51)
  ..cubicTo(78.07, 20.98, 81.2, 22.21, 84.4, 23.21)
  ..cubicTo(87.53, 24.21, 90.73, 24.98, 94, 25.51)
  ..cubicTo(97.27, 26.11, 100.53, 26.51, 103.8, 26.71)
  ..cubicTo(107.07, 26.98, 110.33, 27.11, 113.6, 27.11)
  ..cubicTo(116.87, 27.18, 120.1, 27.15, 123.3, 27.01)
  ..cubicTo(126.5, 26.95, 129.63, 26.85, 132.7, 26.71)
  ..cubicTo(135.77, 26.58, 138.73, 26.51, 141.6, 26.51)
  ..cubicTo(144.47, 26.45, 147.23, 26.48, 149.9, 26.61)
  ..cubicTo(152.57, 26.75, 155.07, 27.05, 157.4, 27.51)
  ..cubicTo(159.8, 27.91, 162, 28.51, 164, 29.31)
  ..cubicTo(166, 30.11, 167.83, 31.15, 169.5, 32.41)
  ..cubicTo(171.17, 33.68, 172.67, 35.18, 174, 36.91)
  ..cubicTo(175.27, 38.58, 176.43, 40.48, 177.5, 42.61)
  ..cubicTo(178.57, 44.75, 179.5, 47.08, 180.3, 49.61)
  ..cubicTo(181.17, 52.08, 181.93, 54.75, 182.6, 57.61)
  ..cubicTo(183.33, 60.48, 184, 63.51, 184.6, 66.71)
  ..cubicTo(185.2, 69.85, 185.8, 73.15, 186.4, 76.61)
  ..cubicTo(187, 80.08, 187.6, 83.68, 188.2, 87.41)
  ..cubicTo(188.8, 91.15, 189.47, 94.98, 190.2, 98.91)
  ..cubicTo(190.93, 102.85, 191.77, 106.85, 192.7, 110.91)
  ..cubicTo(193.57, 115.05, 194.57, 119.25, 195.7, 123.51)
  ..cubicTo(196.77, 127.78, 197.93, 132.08, 199.2, 136.41)
  ..cubicTo(200.4, 140.81, 201.63, 145.18, 202.9, 149.51)
  ..cubicTo(204.17, 153.85, 205.4, 158.15, 206.6, 162.41)
  ..cubicTo(207.73, 166.68, 208.83, 170.85, 209.9, 174.91)
  ..cubicTo(210.9, 179.05, 211.8, 183.05, 212.6, 186.91)
  ..cubicTo(213.4, 190.78, 214, 194.51, 214.4, 198.11)
  ..cubicTo(214.8, 201.65, 215, 205.01, 215, 208.21)
  ..cubicTo(215, 211.41, 214.7, 214.35, 214.1, 217.01)
  ..cubicTo(213.5, 219.75, 212.6, 222.21, 211.4, 224.41)
  ..cubicTo(210.2, 226.55, 208.63, 228.41, 206.7, 230.01)
  ..close();

final Path _cardDarkPath = Path()
  ..fillType = PathFillType.evenOdd
  ..moveTo(263.93, -41.92)
  ..cubicTo(264.52, -40.98, 264.98, -39.9, 265.32, -38.69)
  ..cubicTo(265.67, -37.47, 265.89, -36.17, 266, -34.77)
  ..cubicTo(266.1, -33.34, 266.14, -31.81, 266.1, -30.19)
  ..cubicTo(266.03, -28.6, 265.9, -26.93, 265.69, -25.18)
  ..cubicTo(265.49, -23.46, 265.27, -21.66, 265.02, -19.79)
  ..cubicTo(264.74, -17.96, 264.45, -16.08, 264.13, -14.16)
  ..cubicTo(263.81, -12.24, 263.51, -10.32, 263.23, -8.39)
  ..cubicTo(262.91, -6.44, 262.63, -4.5, 262.41, -2.57)
  ..cubicTo(262.16, -0.67, 261.96, 1.22, 261.83, 3.1)
  ..cubicTo(261.7, 4.98, 261.64, 6.81, 261.64, 8.59)
  ..cubicTo(261.65, 10.37, 261.72, 12.11, 261.85, 13.81)
  ..cubicTo(261.95, 15.51, 262.11, 17.17, 262.31, 18.79)
  ..cubicTo(262.51, 20.41, 262.75, 21.97, 263.03, 23.48)
  ..cubicTo(263.28, 25.02, 263.52, 26.52, 263.77, 28)
  ..cubicTo(264.03, 29.44, 264.29, 30.86, 264.55, 32.24)
  ..cubicTo(264.78, 33.63, 264.99, 34.96, 265.17, 36.25)
  ..cubicTo(265.35, 37.56, 265.48, 38.85, 265.58, 40.09)
  ..cubicTo(265.65, 41.33, 265.66, 42.54, 265.61, 43.71)
  ..cubicTo(265.56, 44.91, 265.44, 46.07, 265.25, 47.19)
  ..cubicTo(265.03, 48.31, 264.72, 49.39, 264.32, 50.43)
  ..cubicTo(263.93, 51.49, 263.44, 52.54, 262.87, 53.55)
  ..cubicTo(262.3, 54.54, 261.64, 55.49, 260.9, 56.4)
  ..cubicTo(260.15, 57.33, 259.34, 58.23, 258.45, 59.09)
  ..cubicTo(257.57, 59.92, 256.62, 60.73, 255.62, 61.51)
  ..cubicTo(254.63, 62.27, 253.59, 62.99, 252.51, 63.68)
  ..cubicTo(251.41, 64.33, 250.26, 64.95, 249.07, 65.54)
  ..cubicTo(247.91, 66.12, 246.72, 66.65, 245.48, 67.1)
  ..cubicTo(244.25, 67.56, 242.99, 67.97, 241.71, 68.33)
  ..cubicTo(240.42, 68.69, 239.13, 68.99, 237.83, 69.23)
  ..cubicTo(236.53, 69.47, 235.24, 69.65, 233.96, 69.77)
  ..cubicTo(232.64, 69.89, 231.33, 69.96, 230.03, 69.99)
  ..cubicTo(228.72, 70.02, 227.41, 70, 226.09, 69.94)
  ..cubicTo(224.76, 69.9, 223.42, 69.83, 222.07, 69.74)
  ..cubicTo(220.72, 69.61, 219.36, 69.49, 217.98, 69.39)
  ..cubicTo(216.6, 69.26, 215.21, 69.13, 213.8, 68.99)
  ..cubicTo(212.39, 68.89, 210.95, 68.78, 209.48, 68.67)
  ..cubicTo(208.01, 68.59, 206.52, 68.53, 205.01, 68.5)
  ..cubicTo(203.47, 68.45, 201.91, 68.44, 200.33, 68.5)
  ..cubicTo(198.75, 68.55, 197.14, 68.65, 195.49, 68.79)
  ..cubicTo(193.84, 68.93, 192.15, 69.14, 190.42, 69.42)
  ..cubicTo(188.69, 69.7, 186.93, 70.02, 185.13, 70.38)
  ..cubicTo(183.37, 70.71, 181.57, 71.09, 179.74, 71.51)
  ..cubicTo(177.93, 71.93, 176.13, 72.35, 174.32, 72.77)
  ..cubicTo(172.49, 73.22, 170.67, 73.64, 168.86, 74.03)
  ..cubicTo(167.06, 74.42, 165.28, 74.78, 163.52, 75.12)
  ..cubicTo(161.75, 75.45, 160.03, 75.73, 158.33, 75.96)
  ..cubicTo(156.64, 76.18, 154.99, 76.33, 153.38, 76.41)
  ..cubicTo(151.77, 76.47, 150.21, 76.44, 148.71, 76.32)
  ..cubicTo(147.24, 76.24, 145.81, 76.03, 144.43, 75.68)
  ..cubicTo(143.08, 75.34, 141.8, 74.88, 140.6, 74.28)
  ..cubicTo(139.43, 73.7, 138.32, 72.98, 137.27, 72.13)
  ..cubicTo(136.24, 71.32, 135.3, 70.41, 134.45, 69.41)
  ..cubicTo(133.61, 68.37, 132.84, 67.28, 132.16, 66.11)
  ..cubicTo(131.51, 64.92, 130.95, 63.68, 130.46, 62.39)
  ..cubicTo(129.98, 61.1, 129.59, 59.76, 129.3, 58.37)
  ..cubicTo(129.01, 56.98, 128.83, 55.56, 128.76, 54.1)
  ..cubicTo(128.68, 52.68, 128.7, 51.23, 128.81, 49.77)
  ..cubicTo(128.95, 48.31, 129.2, 46.86, 129.55, 45.43)
  ..cubicTo(129.9, 43.99, 130.35, 42.59, 130.9, 41.21)
  ..cubicTo(131.46, 39.86, 132.14, 38.52, 132.96, 37.2)
  ..cubicTo(133.75, 35.91, 134.62, 34.65, 135.58, 33.44)
  ..cubicTo(136.57, 32.23, 137.62, 31.04, 138.72, 29.88)
  ..cubicTo(139.83, 28.71, 140.99, 27.57, 142.21, 26.45)
  ..cubicTo(143.43, 25.33, 144.67, 24.21, 145.92, 23.09)
  ..cubicTo(147.17, 21.97, 148.42, 20.86, 149.67, 19.78)
  ..cubicTo(150.95, 18.66, 152.2, 17.54, 153.42, 16.42)
  ..cubicTo(154.61, 15.3, 155.77, 14.15, 156.91, 12.99)
  ..cubicTo(158.04, 11.83, 159.1, 10.64, 160.09, 9.43)
  ..cubicTo(161.08, 8.22, 161.98, 6.99, 162.8, 5.73)
  ..cubicTo(163.61, 4.44, 164.33, 3.11, 164.94, 1.73)
  ..cubicTo(165.56, 0.39, 166.07, -1, 166.48, -2.43)
  ..cubicTo(166.92, -3.85, 167.26, -5.28, 167.53, -6.73)
  ..cubicTo(167.82, -8.17, 168.05, -9.62, 168.22, -11.08)
  ..cubicTo(168.42, -12.53, 168.57, -13.97, 168.68, -15.4)
  ..cubicTo(168.82, -16.83, 168.93, -18.24, 169.03, -19.61)
  ..cubicTo(169.14, -20.98, 169.26, -22.31, 169.41, -23.59)
  ..cubicTo(169.53, -24.87, 169.69, -26.1, 169.89, -27.28)
  ..cubicTo(170.09, -28.46, 170.35, -29.56, 170.68, -30.58)
  ..cubicTo(170.99, -31.62, 171.37, -32.57, 171.83, -33.42)
  ..cubicTo(172.3, -34.27, 172.85, -35.04, 173.51, -35.71)
  ..cubicTo(174.16, -36.39, 174.91, -36.98, 175.76, -37.48)
  ..cubicTo(176.57, -37.96, 177.48, -38.38, 178.49, -38.74)
  ..cubicTo(179.51, -39.11, 180.6, -39.4, 181.77, -39.62)
  ..cubicTo(182.92, -39.88, 184.16, -40.08, 185.48, -40.23)
  ..cubicTo(186.8, -40.4, 188.19, -40.54, 189.66, -40.64)
  ..cubicTo(191.09, -40.74, 192.6, -40.84, 194.18, -40.92)
  ..cubicTo(195.77, -41.01, 197.41, -41.09, 199.11, -41.16)
  ..cubicTo(200.82, -41.23, 202.57, -41.33, 204.37, -41.45)
  ..cubicTo(206.17, -41.57, 208, -41.73, 209.87, -41.93)
  ..cubicTo(211.77, -42.1, 213.7, -42.33, 215.67, -42.61)
  ..cubicTo(217.64, -42.86, 219.62, -43.15, 221.63, -43.49)
  ..cubicTo(223.66, -43.8, 225.68, -44.12, 227.69, -44.45)
  ..cubicTo(229.69, -44.79, 231.68, -45.11, 233.66, -45.42)
  ..cubicTo(235.63, -45.71, 237.55, -45.98, 239.43, -46.24)
  ..cubicTo(241.33, -46.47, 243.17, -46.66, 244.94, -46.81)
  ..cubicTo(246.72, -46.97, 248.42, -47.04, 250.05, -47.03)
  ..cubicTo(251.65, -47.02, 253.17, -46.93, 254.61, -46.77)
  ..cubicTo(256.04, -46.6, 257.34, -46.31, 258.5, -45.9)
  ..cubicTo(259.69, -45.49, 260.75, -44.96, 261.67, -44.31)
  ..cubicTo(262.56, -43.66, 263.32, -42.87, 263.93, -41.92)
  ..close();
