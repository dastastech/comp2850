import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My Third Flutter App'),
          ),
          body: Column(
            children: <Widget>[
              const Text('Hello World!!'),
              Center(
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    ),
  );
}
