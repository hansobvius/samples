import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> createBackup(Box<String> favoriteBooksBox, GlobalKey<ScaffoldState> scaffoldKey) async {
  if (favoriteBooksBox.isEmpty) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text('Pick a favorite book.')),
    );
    return;
  }
  scaffoldKey.currentState.showSnackBar(
    SnackBar(content: Text('Creating backup...')),
  );
  Map<String, String> map = favoriteBooksBox
      .toMap()
      .map((key, value) => MapEntry(key.toString(), value));
  String json = jsonEncode(map);
  Directory dir = await _getDirectory();
  String formattedDate = DateTime.now()
      .toString()
      .replaceAll('.', '-')
      .replaceAll(' ', '-')
      .replaceAll(':', '-');
  String path = '${dir.path}$formattedDate.hivebackup';
  File backupFile = File(path);
  await backupFile.writeAsString(json);
}

Future<Directory> _getDirectory() async {
  Directory directory = await getExternalStorageDirectory();
  const String pathExt = '/backups/';
  Directory newDirectory = Directory(directory.path + pathExt);
  if (await newDirectory.exists() == false) {
    return newDirectory.create(recursive: true);
  }
  return newDirectory;
}

Future<void> restoreBackup(Box<String> favoriteBooksBox, GlobalKey<ScaffoldState> scaffoldKey) async {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(content: Text('Restoring backup...')),
  );
  File file = await FilePicker.getFile(
    type: FileType.any,
  );
  if (file == null) return;
  favoriteBooksBox.clear();
  Map<dynamic, dynamic> map =
  jsonDecode(await file.readAsString()) as Map<dynamic, dynamic>;
  Map<int, String> newMap =
  map.map<int, String>((key, value) => MapEntry(int.parse(key), value));
  favoriteBooksBox.putAll(newMap);
}