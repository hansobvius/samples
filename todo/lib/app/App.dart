import 'package:flutter/material.dart';
import 'package:todo/app/ui/home/Home.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Hive To-Do App',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: Home()
    );
  }
}