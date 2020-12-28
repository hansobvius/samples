import 'package:flutter/material.dart';
import 'package:todo/app/entity/todo/Todo.dart';

class TodoCard extends StatelessWidget{

  final Todo todo;

  TodoCard({this.todo});

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  todo.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: todo.done ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  '${todo.created.hour}:${todo.created.minute}:'
                      '${todo.created.second}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              iconSize: 30,
              icon: Icon(todo.done ? Icons.clear : Icons.check),
              onPressed: () {
                todo.done = !todo.done;
                todo.save();
              },
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.delete),
              onPressed: () {
                todo.delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}