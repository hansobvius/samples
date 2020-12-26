import 'package:flutter/material.dart';
import 'ui/home/Home.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Favorite Books with Hive',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home()
    );
  }
}