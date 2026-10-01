// flutter test tool/render_screens_test.dart
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_helix/main.dart';

void main() {
  testWidgets('Render every original Figma frame for visual review', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final family in ['Poppins', 'LilitaOne']) {
      final loader = FontLoader(family)
        ..addFont(rootBundle.load('assets/fonts/$family-Regular.ttf'));
      if (family == 'Poppins') {
        loader.addFont(rootBundle.load('assets/fonts/Poppins-SemiBold.ttf'));
        loader.addFont(rootBundle.load('assets/fonts/Poppins-Bold.ttf'));
      }
      await loader.load();
    }
    Directory('design/preview').createSync(recursive: true);
    for (final name in helixScreens.keys) {
      tester.view.physicalSize = Size(
        283,
        ['concepts', 'alterations'].contains(name) ? 680 : 540,
      );
      final key = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: HelixApp(screen: name),
        ),
      );
      await tester.runAsync(() async {
        for (final element in find.byType(Image).evaluate()) {
          await precacheImage((element.widget as Image).image, element);
        }
      });
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: name);
      await tester.runAsync(() async {
        final boundary =
            key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
        final image = await boundary.toImage(pixelRatio: 3);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        File(
          'design/preview/$name.png',
        ).writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });
    }
  });
}
