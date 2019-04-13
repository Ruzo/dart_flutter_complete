import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
// import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'data_cache.dart';
import '../models/item_model.dart';

class DbProvider implements DataCache {
  static Database _db;

  Future<Database> get openedDb async {
    if (_db != null) return _db;
    _db = await init();
    return _db;
  }

  Future<Database> init() async {
    var dbsPath = await getDatabasesPath();
    String path = join(dbsPath, 'news.db');

    Database dbInit = await openDatabase(
      path,
      version: 1,
      onCreate: (newDb, version) async {
        await newDb.execute('''
          create table items (
            id integer primary key,
            deleted integer,
            type text,
            by text,
            time integer,
            text text,
            dead integer,
            parent integer,
            kids blob,
            url text,
            score integer,
            title text,
            descendants integer
          )
          ''');
        await newDb.execute('''
          create table top_ids (
            id integer primary key,
            ids blob
          )
          ''');
        await newDb.insert('top_ids', {'id': 0, 'ids': []});
      },
    );
    return dbInit;
  }

  Future<ItemModel> getItem(int id) async {
    print('in DBProvider with id $id');
    Database db = await openedDb;
    List<Map> maps = await db.query('items', where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) return ItemModel.fromMap(maps.first);
    print('$id not found in DB');
    return null;
  }

  Future<int> insertItem(ItemModel item) async {
    Database db = await openedDb;
    return db.insert('items', item.toMap());
  }

  Future<List<int>> getTopList() async {
    Database db = await openedDb;
    List<Map> map = await db.query('top_ids', where: 'id = ?', whereArgs: [0]);
    List<int> ids = jsonDecode(map.first['ids']);
    return ids;
  }

  Future<int> updateTopList(List<int> ids) async {
    Database db = await openedDb;
    return db.update('top_ids', {'ids': ids}, where: 'id = ?', whereArgs: [0]);
  }
}
