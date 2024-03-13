import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade100,
      child: const Center(
        child: Text(
          '4th Screen',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
