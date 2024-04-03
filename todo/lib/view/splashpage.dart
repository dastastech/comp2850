import 'package:flutter/material.dart';

class SplahPage extends StatelessWidget {
  const SplahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/shape.png',
                  width: 141,
                  height: 129,
                ),
              ],
            ),
            Image.asset('assets/images/onboarding-image.png'),
          ],
        ),
      ),
    );
  }
}
