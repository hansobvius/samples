import 'package:mobx/mobx.dart';
import 'package:todo/app/database/IDatabase.dart';
import 'package:todo/app/entity/todo/Todo.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{

  IDatabase _iDatabase;

  @observable
  ObservableList<Todo> todoStore = ObservableList<Todo>();

  @action
  void insert(Todo todo){
    // TODO - add implement
    // _iDatabase.add(obj);
  }
}