import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int indiceSeleccionado = 0;

  final List<String> _pantallas = [
    'https://www.inter.edu',
    'https://www.arecibo.inter.edu',
    'https://www.google.com',
  ];

  void cambiarPantalla(int indice) {
    setState(() {
      indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: _pantallas[indiceSeleccionado],
      ),
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
        ],
      ),
    );
  }
}
