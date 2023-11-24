import 'package:flutter/material.dart';

import 'content_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyCard (v-card)",
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 65.0,
                  foregroundImage: AssetImage('/images/avatar-2.jpg'),
                ),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    fontFamily: 'SourceCode',
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const ContentText(
                    title: 'john.doe@gmail.com', icon: Icons.email),
                const ContentText(title: '+1(787)345-1234', icon: Icons.phone),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  '/images/qr-code.png',
                  width: 250.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'QR Code',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.teal.shade200,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
