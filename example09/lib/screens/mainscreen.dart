import 'package:flutter/material.dart';

import 'package:example09/screens/firstscreen.dart';
import 'package:example09/screens/fourthscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int indiceSeleccionado = 0;

  final List<Widget> _pantallas = [
    const FirstScreen(),
    const Center(
      child: Text('Second Tab'),
    ),
    const Center(
      child: Text('Third Tab'),
    ),
    const FourthScreen()
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
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.blue.shade400,
      ),
    );
  }
}
