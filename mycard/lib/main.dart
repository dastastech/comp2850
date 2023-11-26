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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 65.0,
                        foregroundImage: AssetImage('images/avatar-2.jpg'),
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
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContentText(
                          title: 'john.doe@gmail.com', icon: Icons.email),
                      ContentText(title: '+1(787)345-1234', icon: Icons.phone),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'images/qr-code.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
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
