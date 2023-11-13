import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Descripcion',
        style: TextStyle(color: Colors.white),
      ),
    );
    // return const Expanded(
    //   child: Text('New Description'),
    // );
  }
}
