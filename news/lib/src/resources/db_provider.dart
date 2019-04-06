import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import '../models/item_model.dart';

class DbProvider {
  Database db;

  void init() async {
    var dbsPath = await getDatabasesPath();
    String path = join(dbsPath, 'news.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          create table items (
            id integer primary key
            deleted integer
            type text
            by text
            time integer
            text text
            dead integer
            parent integer
            kids blob
            url text
            score integer
            title text
            descendants integer
          )
          ''');
      },
    );

    Future getItem(int id) async {
      List<Map> maps = await db.query('news', where: 'id = ?', whereArgs: [id]);

      print(maps);

      //TODO: turn maps to ItemModel
      return maps;
    }
  }
}
