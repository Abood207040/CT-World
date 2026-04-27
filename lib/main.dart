import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_ct.dart';
import 'screens/about_us.dart';
import 'screens/ct-anatomey_screen.dart';
import 'screens/ct_examination.dart';
import 'screens/refrences_screen.dart';
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
      initialRoute: '/home',
      routes: {
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
