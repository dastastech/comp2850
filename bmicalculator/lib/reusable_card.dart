import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard(
      {required this.backColor, required this.cardChild, this.onPress});

  final Color backColor;
  final Widget cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
