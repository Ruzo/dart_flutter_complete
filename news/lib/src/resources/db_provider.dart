import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
// import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'data_cache.dart';
import '../models/item_model.dart';

class DbProvider implements DataCache {
  Database db;

  void init() async {
    var dbsPath = await getDatabasesPath();
    String path = join(dbsPath, 'news.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (newDb, version) async {
        await newDb.execute('''
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
        await newDb.execute('''
          create table top_ids (
            id integer primary key
            ids blob
          )
          ''');
        await newDb.insert('top_ids', {'id': 0, 'ids': []});
      },
    );
  }

  Future<ItemModel> getItem(int id) async {
    List<Map> maps = await db.query('items', where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) return ItemModel.fromMap(maps.first);
    return null;
  }

  Future<int> insertItem(ItemModel item) {
    return db.insert('items', item.toMap());
  }

  Future<List<int>> getTopList() async {
    List<Map> map = await db.query('top_ids', where: 'id = ?', whereArgs: [0]);
    List<int> ids = jsonDecode(map.first['ids']);
    return ids;
  }

  Future<int> updateTopList(List<int> ids) {
    return db.update('top_ids', {'ids': ids}, where: 'id = ?', whereArgs: [0]);
  }
}
