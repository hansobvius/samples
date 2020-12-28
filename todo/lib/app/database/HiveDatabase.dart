import 'package:hive/hive.dart';
import 'package:todo/app/entity/todo/Todo.dart';
import 'IDatabase.dart';

class HiveDatabase<T> extends IDatabase<T>{

  Box _box;

  HiveDatabase(T hiveEntity) : super(hiveEntity);

  @override
  void add(T obj) {
    // TODO: implement add
    _box.put(key, obj);
  }

  @override
  void delete() {
    // TODO: implement delete
    _box.delete(key);
  }

  @override
  List<T> get() {
    // TODO: implement get
    var todos = _box.get(key);
    return todos;
  }
}

