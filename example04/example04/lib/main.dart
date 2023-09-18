import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Example 4',
          ),
        ),
        body: const Center(
          child: Column(
            children: <Widget>[
              Text(
                'Hello world!!',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32,
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 44,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print('Clicked');
          },
        ),
      ),
    ),
  );
}
