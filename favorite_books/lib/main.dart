import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/App.dart';
import 'app/entity/Book.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(favoritesBox);
  runApp(App());
}
