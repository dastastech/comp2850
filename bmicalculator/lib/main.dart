import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      routes: {
        '/': (context) => const InputPage(),
        '/bmiResultPage': (context) => const ResultsPage(),
      },
      initialRoute: '/',
    );
  }
}
