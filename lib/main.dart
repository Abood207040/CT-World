import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/definition_screen.dart';
import 'screens/usage_screen.dart';
import 'screens/risks_screen.dart';
import 'screens/protocol_screen.dart';
import 'screens/cases_screen.dart';
import 'screens/protection_screen.dart';

void main() {
  runApp(const CTWorldApp());
}

class CTWorldApp extends StatelessWidget {
  const CTWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CT WORLD',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.redAccent,
      ),
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
        '/definition': (_) => const DefinitionScreen(),
        '/usage': (_) => const UsageScreen(),
        '/risks': (_) => const RisksScreen(),
        '/protocol': (_) => const ProtocolScreen(),
        '/cases': (_) => const CasesScreen(),
        '/protection': (_) => const ProtectionScreen(),
      },
    );
  }
}
