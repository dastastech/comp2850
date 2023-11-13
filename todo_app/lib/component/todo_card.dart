import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String todoText;

  const TodoCard({super.key, required this.todoText});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isTodoChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      // color: todos[index].length>=10? Colors.blue[400]:
      //   msgCount[index]>3? Colors.blue[100]: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              widget.todoText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ),
          Center(
            child: CupertinoCheckbox(
              value: _isTodoChecked,
              onChanged: (value) {
                setState(
                  () {
                    _isTodoChecked = value!;
                  },
                );
              },
              activeColor: Colors.amber.shade200,
              checkColor: Colors.black87,
              inactiveColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
