import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Widget getIcon(int index, Box<String> favoriteBooksBox) {
  if (favoriteBooksBox.containsKey(index)) {
    return Icon(Icons.favorite, color: Colors.red);
  }
  return Icon(Icons.favorite_border);
}