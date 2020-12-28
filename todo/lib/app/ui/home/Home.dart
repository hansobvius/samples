import 'package:flutter/material.dart';
import 'package:todo/app/entity/todo/Todo.dart';
import 'package:todo/app/ui/home/components/TodoMainScreen.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  bool _isReversed;

  @override
  void initState(){
    _isReversed = false;
    super.initState();
  }

  void changeListOrder(){
    setState(() {
      _isReversed = !_isReversed;
    });
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: FutureBuilder(
          future: Future.wait([
            Hive.openBox('settings'),
            Hive.openBox<Todo>(hiveKey),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                print(snapshot.error);
                return Scaffold(
                  body: Center(
                    child: Text('Something went wrong :/'),
                  ),
                );
              } else {
                return TodoMainScreen();
              }
            } else {
              return Scaffold(
                body: Center(
                  child: Text('Opening Hive...'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}