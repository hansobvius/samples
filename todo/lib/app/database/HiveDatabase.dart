import 'package:hive/hive.dart';
import 'package:todo/app/entity/todo/Todo.dart';
import 'IDatabase.dart';

class HiveDatabase extends IDatabase<Todo>{

  @override
  void add(int index, Todo obj, String key) {
    Hive.box<Todo>(key).add(obj);
  }

  @override
  void delete(int index, List<Todo> objList) {
    // TODO: implement delete
  }

  @override
  List<Todo> get(String key) {
    // TODO: implement get
  }
}

