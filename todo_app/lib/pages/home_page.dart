import 'package:flutter/services.dart'; // For `SystemChrome`

import 'package:flutter/material.dart';
import 'package:todo_app/component/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('Entering full screen mode...');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    super.dispose();
    print('Exiting full screen mode...');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  TextEditingController txtTodoItem = TextEditingController();

  List<String> todos = <String>[
    'Ir al Supermercado',
    'Estudiar de Bases de Datos',
    'Cita médica',
    'Actualizar resumé',
    'Recortar el patio',
    'Pasear al perro',
  ];

  void addTodoToList(String todoItem) {
    setState(() {
      todos.insert(0, todoItem);
    });
  }

  void addTodo() {
    addTodoToList(txtTodoItem.text);
    txtTodoItem.text = '';
    Navigator.pop(context);
  }

  void cancel() {
    txtTodoItem.text = '';
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.grey.shade800,
          size: 28,
        ),
        title: Center(
          child: Text(
            'T O D O   A P P',
            style: TextStyle(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              Icons.search,
              color: Colors.grey.shade800,
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoCard(
                  todoText: todos[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTodo,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void createTodo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'TODO',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.grey,
              height: 4.0,
            ),
            Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                maxLength: 50,
                controller: txtTodoItem,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Your text here.', border: InputBorder.none,
                  // border: OutlineInputBorder(
                  //   borderSide: const BorderSide(
                  //     width: 1,
                  //     color: Colors.black26,
                  //   ),
                  //   borderRadius: BorderRadius.circular(4),
                  // ),
                ),
                maxLines: 2,
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 4.0,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          MaterialButton(
            color: Colors.grey.shade100,
            textColor: Colors.black,
            onPressed: cancel,
            // style: ButtonStyle(
            //   foregroundColor:
            //       MaterialStateProperty.all<Color>(Colors.black87),
            // ),
            child: const Text('Cancel'),
          ),
          // const SizedBox(
          //   width: 12,
          // ),
          MaterialButton(
            color: Colors.amber,
            textColor: Colors.black,
            onPressed: addTodo,
            child: const Text('Add'),
          ),
        ],
      ),
      //   ],
      // ),
    );
  }
}
