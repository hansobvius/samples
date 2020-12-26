import 'package:favorite_books/app/domain/HomeDomain.dart';
import 'package:favorite_books/app/entity/Book.dart';
import 'package:favorite_books/app/storage/file_manager/backup.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'components/WidgetCompoents.dart';

class Home extends StatefulWidget{

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Box<String> favoriteBooksBox;

  @override
  void initState() {
    super.initState();
    favoriteBooksBox = Hive.box<String>(favoritesBox);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Favorite Books w/ Hive'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backup),
            onPressed: (){
              createBackup(favoriteBooksBox, _scaffoldKey);
            },
          ),
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: (){
              restoreBackup(favoriteBooksBox, _scaffoldKey);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: favoriteBooksBox.listenable(),
        builder: (context, Box<String> box, _) {
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, listIndex) {
              return ListTile(
                title: Text(books[listIndex]),
                trailing: IconButton(
                  icon: getIcon(listIndex, favoriteBooksBox),
                  onPressed: () => onFavoritePress(listIndex, favoriteBooksBox),
                ),
              );
            },
          );
        },
      ),
    );
  }
}