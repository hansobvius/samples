import 'package:hive/hive.dart';
import 'package:todo/app/entity/IEntity.dart';

abstract class IDatabase<T>{

  T _hiveEntity;

  String get _entityKey => (_hiveEntity as IEntity).hiveKey;
  String get key => _entityKey;

  IDatabase(T hiveEntity){
    this._hiveEntity = hiveEntity;
    Hive.openBox<T>(_entityKey);
  }

  void add(T obj);

  void delete(List<T> objList);

  List<T> get();
}
