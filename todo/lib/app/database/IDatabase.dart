import 'package:hive/hive.dart';
import 'package:todo/app/entity/IEntity.dart';

abstract class IDatabase<T>{

  T hiveEntity;

  IDatabase({this.hiveEntity}){
    Hive.openBox<T>((hiveEntity as IEntity).hiveKey);
  }

  void add(int index);

  void delete(int index, List<T> objList);

  List<T> get();
}
