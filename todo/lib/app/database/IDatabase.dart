import 'package:hive/hive.dart';
import 'package:todo/app/entity/IEntity.dart';

abstract class IDatabase<T>{

  T hiveEntity;

  String get _entityKey => (hiveEntity as IEntity).hiveKey;
  String get key => _entityKey;

  IDatabase({this.hiveEntity}){
    Hive.openBox<T>(_entityKey);
    get(_entityKey);
  }

  void add(int index, T obj, String key);

  void delete(int index, List<T> objList);

  List<T> get(String key);
}
