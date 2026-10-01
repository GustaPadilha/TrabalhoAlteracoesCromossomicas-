import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract final class HelixColors {
  static const cream = Color(0xFFE6DAC8);
  static const ink = Color(0xFF1D1C1C);
  static const darkBlue = Color(0xFF285B83);
  static const blue = Color(0xFF3D7594);
  static const mediumBlue = Color(0xFF538CAA);
  static const lightBlue = Color(0xFF80AFC3);
}

/// Scale the 283-unit Figma canvas uniformly; scroll taller frames on phones.
class HelixCanvas extends StatelessWidget {
  const HelixCanvas({
    super.key,
    this.height = 540,
    this.background = HelixColors.cream,
    required this.children,
  });

  final double height;
  final Color background;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = math.min(constraints.maxWidth, 480.0);
            final scaledHeight = height * width / 283;
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: width,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: width,
                    height: math.max(scaledHeight, constraints.maxHeight),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: width,
                        height: scaledHeight,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: SizedBox(
                            width: 283,
                            height: height,
                            child: ColoredBox(
                              color: background,
                              child: Stack(
                                clipBehavior: Clip.hardEdge,
                                children: children,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HelixText extends StatelessWidget {
  const HelixText(
    this.data, {
    super.key,
    this.size = 18,
    this.color = HelixColors.ink,
    this.display = true,
    this.weight = FontWeight.w400,
    this.height,
    this.align = TextAlign.left,
  });

  final String data;
  final double size;
  final Color color;
  final bool display;
  final FontWeight weight;
  final double? height;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: TextStyle(
        fontFamily: display ? 'LilitaOne' : 'Poppins',
        fontSize: size,
        fontWeight: weight,
        letterSpacing: 0,
        height: height ?? 1.16,
        color: color,
      ),
    );
  }
}

/// Intentionally disabled until the application flow is implemented.
class HelixButton extends StatelessWidget {
  const HelixButton({
    super.key,
    required this.label,
    this.background = HelixColors.ink,
    this.foreground = HelixColors.cream,
    this.fontSize = 16,
    this.radius = 15,
  });

  final String label;
  final Color background;
  final Color foreground;
  final double fontSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(background),
        foregroundColor: WidgetStatePropertyAll(foreground),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
      child: Transform.translate(
        offset: const Offset(0, 1),
        child: HelixText(label, size: fontSize, color: foreground),
      ),
    );
  }
}

class HelixBackButton extends StatelessWidget {
  const HelixBackButton({super.key, this.color = HelixColors.ink});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Voltar',
      button: true,
      enabled: false,
      child: SizedBox.square(
        dimension: 24,
        child: CustomPaint(painter: _BackArrowPainter(color)),
      ),
    );
  }
}

class _BackArrowPainter extends CustomPainter {
  const _BackArrowPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(5, 12)
      ..lineTo(19, 12)
      ..moveTo(11, 18)
      ..lineTo(5, 12)
      ..lineTo(11, 6);
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(_BackArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}
