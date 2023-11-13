import 'package:flutter/material.dart';

class Coffees extends StatelessWidget {
  const Coffees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffees'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/recipes');
          },
          child: const Text('Recipes'),
        ),
      ),
    );
  }
}
