import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      child: const Center(
        child: Text(
          'First Screen',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
