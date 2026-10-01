import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_helix/main.dart';

void main() {
  setUpAll(() async {
    for (final family in ['Poppins', 'LilitaOne']) {
      final loader = FontLoader(family)
        ..addFont(rootBundle.load('assets/fonts/$family-Regular.ttf'));
      if (family == 'Poppins') {
        loader.addFont(rootBundle.load('assets/fonts/Poppins-SemiBold.ttf'));
        loader.addFont(rootBundle.load('assets/fonts/Poppins-Bold.ttf'));
      }
      await loader.load();
    }
  });
  testWidgets('All 12 screens render at reference and phone sizes', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final size in [
      const Size(283, 540),
      const Size(393, 852),
      const Size(320, 568),
    ]) {
      tester.view.physicalSize = size;
      for (final name in helixScreens.keys) {
        await tester.pumpWidget(
          HelixApp(key: ValueKey('$name-$size'), screen: name),
        );
        await tester.pump();
        expect(tester.takeException(), isNull, reason: '$name at $size');
        for (final button in tester.widgetList<TextButton>(
          find.byType(TextButton),
        )) {
          expect(
            button.onPressed,
            isNull,
            reason: 'Prototype controls have no actions',
          );
        }
      }
    }
  });

  testWidgets('Login fields are visual only and buttons do not navigate', (
    tester,
  ) async {
    await tester.pumpWidget(const HelixApp(screen: 'login'));
    expect(find.byType(TextField), findsNWidgets(2));
    for (final field in tester.widgetList<TextField>(find.byType(TextField))) {
      expect(field.readOnly, isTrue);
      expect(field.canRequestFocus, isFalse);
    }
    await tester.tap(find.text('ENTRAR'));
    await tester.pump();
    expect(find.text('LOG IN'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
