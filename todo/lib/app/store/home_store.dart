import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:todo/app/database/HiveDatabase.dart';
import 'package:todo/app/database/IDatabase.dart';
import 'package:todo/app/entity/todo/Todo.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

  final Todo todoObj = Todo();

  Box<Todo> todo;

  Future<void> initBox() async {
    todo = await Hive.box(hiveKey);
  }

  HiveDatabase _hiveDatabase = HiveDatabase<Todo>(Todo());

  @observable
  ObservableList<Todo> todoStore = ObservableList<Todo>();

  @action
  void insert(Todo todo){
    _hiveDatabase.add(todo);
    final result = _hiveDatabase.get() as List<Todo>;
    todoStore.addAll(result);
  }

  @action
  void delete(){
    _hiveDatabase.delete();
    todoStore.clear();
  }
}