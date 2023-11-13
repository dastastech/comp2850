import 'package:flutter/material.dart';

import './views/splash.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '30 Days Fit Challenge',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        // '/recipes': (context) => const Recipes(),
      },
    );
  }
}
