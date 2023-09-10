import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: const AppBar(
          title: Text(
            'My Second App',
          ),
        ),
        body: const Center(
          child: Text('My Second Project',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              )),
        ),
      ),
    ),
  );
}
