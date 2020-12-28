import 'package:flutter/material.dart';
import 'package:todo/app/entity/todo/Todo.dart';

import 'TodoCard.dart';


class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList(List<Todo> todo, {this.todos});

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return Center(
        child: Text('Noting to do... Great!'),
      );
    } else {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          var todo = todos[index];
          return TodoCard(todo: todo);
        },
      );
    }
  }
}