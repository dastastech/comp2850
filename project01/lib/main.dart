import 'package:flutter/material.dart';

import './screens/coffees.dart';
import './screens/recipes.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cambio de Pantallas con Routes',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const Coffees(),
        '/recipes': (context) => const Recipes(),
      },
    );
  }
}
