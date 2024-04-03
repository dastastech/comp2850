import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:recipes/pages/desserts.dart';
import 'package:recipes/pages/dish.dart';
import 'package:recipes/pages/drinks.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int indiceSeleccionado = 0;

  final List<Widget> _pantallas = [
    const Dish(),
    const Desserts(),
    const Drinks(),
  ];

  void cambiarPantalla(int indice) {
    setState(() {
      indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[indiceSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceSeleccionado,
        onTap: cambiarPantalla,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Symbols.skillet),
            label: 'Dishes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.cookie),
            label: 'Desserts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.blender),
            label: 'Drinks',
          ),
        ],
      ),
    );
  }
}
