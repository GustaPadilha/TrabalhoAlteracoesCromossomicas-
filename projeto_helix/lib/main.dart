import 'package:flutter/material.dart';

import 'screens/auth_screens.dart';
import 'screens/dashboard_screens.dart';
import 'screens/learning_screens.dart';
import 'widgets/helix_ui.dart';

void main() => runApp(const HelixApp());

/// Inspect each frame without adding navigation to the prototype:
/// flutter run --dart-define=HELIX_SCREEN=home
const previewScreen = String.fromEnvironment(
  'HELIX_SCREEN',
  defaultValue: 'welcome',
);

const helixScreens = <String, Widget>{
  'welcome': WelcomeScreen(),
  'register': RegisterScreen(),
  'login': LoginScreen(),
  'home': HomeScreen(),
  'profile': ProfileScreen(),
  'concepts': ConceptsScreen(),
  'videos': VideosScreen(),
  'sites': SitesScreen(),
  'flashcard': FlashcardScreen(),
  'flashcards': FlashcardsScreen(),
  'alterations': AlterationsScreen(),
  'detail': DetailScreen(),
};

class HelixApp extends StatelessWidget {
  const HelixApp({super.key, this.screen = previewScreen});

  final String screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: HelixColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: HelixColors.darkBlue,
          surface: HelixColors.cream,
        ),
      ),
      home: helixScreens[screen] ?? const WelcomeScreen(),
    );
  }
}
