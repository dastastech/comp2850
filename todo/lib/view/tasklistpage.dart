import 'package:flutter/material.dart';

import '../components/pagetitle.dart';
import '../components/shape.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPage();
}

class _TaskListPage extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    const Shape(),
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    PageTitle(
                      'Completa tus tareas',
                      color: Theme.of(context).colorScheme.background,
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: Column(children: [
                Text('Prueba'),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
