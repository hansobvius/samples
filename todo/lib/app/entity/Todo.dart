import 'package:hive/hive.dart';

part 'Todo.g.dart';

const todoKey = 'TODO_KEY';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime created;

  @HiveField(2)
  bool done = false;
}