import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      elevation: 4.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      onPressed: () {
        onPressed();
      },
      child: Icon(icon),
    );
  }
}
