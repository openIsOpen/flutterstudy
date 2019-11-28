import 'dart:async' as prefix0;

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dog.dart';

class SqlTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sql'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('数据库测试'),
          color: Colors.blue,
          onPressed: () async {
            await handleDb();
          },
        ),
      ),
    );
  }

  void handleDb() async {
    //1.open db and create dogs table
    print('begin to create database');
    var db = await openDb();
    //3.insert data
    await insertData(Dog(id: 1, name: 'zhangsan', age: 10), db);
    print('inserted');
    //4.query data
    List<Dog> result = await dogs(db);
    print('query data : ${result.toString()}');
    List.generate(result.length, (i) {
      print('id:${result[i].id},name:${result[i].name},age:${result[i].age}');
    });
    //6.update dog
    await updateDogs(Dog(id: 1, name: 'lisi', age: 20), db);
    result = await dogs(db);
    print('query data : ${result.toString()}');
    List.generate(result.length, (i) {
      print('id:${result[i].id},name:${result[i].name},age:${result[i].age}');
    });
    //7.delete dog
    print('delete');
    await insertData(Dog(id: 2, name: 'zhangsan12', age: 1012), db);
    List.generate(result.length, (i) {
      print('id:${result[i].id},name:${result[i].name},age:${result[i].age}');
    });
    
    await deleteDog(1, db);
    print('delete id = 1');
    result = await dogs(db);
    List.generate(result.length, (i) {
      print('id:${result[i].id},name:${result[i].name},age:${result[i].age}');
    });
  }

  Future<void> insertData(Dog data, Database db) async {
    await db.insert('dogs', data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateDogs(Dog data, Database db) async {
    await db
        .update('dogs', data.toMap(), where: 'id = ?', whereArgs: [data.id]);
  }

  Future<void> deleteDog(int id, Database db) async {
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<List<Dog>> dogs(Database db) async {
    List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (i) {
      return Dog(id: maps[i]['id'], name: maps[i]['name'], age: maps[i]['age']);
    });
  }

  Future<Database> openDb() async {
    String sqlCmd =
        'create table dogs(id integer primary key,name text,age integer)';
    print('path:${await getDatabasesPath()}');
    return openDatabase(join(await (getDatabasesPath()), 'doggie_database.db'),
        onCreate: (db, version) {
      print('database created');
      db.execute(sqlCmd);
      print('table created');
    }, version: 1);
  }
}
