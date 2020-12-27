import 'package:hive/hive.dart';
import 'package:todo/app/entity/IEntity.dart';

part 'Todo.g.dart';

const hiveKey = 'TODO_KEY';

@HiveType(typeId: 0)
class Todo extends HiveObject implements IEntity {

  @override
  String get hiveKey => hiveKey;

  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime created;

  @HiveField(2)
  bool done = false;
}