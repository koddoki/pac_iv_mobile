import 'package:ondwaveda/login/data/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class OndwavedaDB {
  static const _databaseName = "user.db";
  static const _databaseVersion = 1;

  OndwavedaDB._();
  static final OndwavedaDB instance = OndwavedaDB._();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE Usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        senha varchar(255),
        nome varchar(255)
      )
    ''');
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> dropDB() async {
    Database db = await database;
    await deleteDatabase(db.path);
  }

  Future<void> insertUser(Usuario user) async {

    final db = await database;

    await db.insert(
      'Usuario',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future users() async {
    final db = await database;

    return await db.query("Usuario");
  }

  Future searchUser(nome, senha) async{
    final db = await database;

    return await db.query("Usuario",where: "nome = ? and senha = ? ", whereArgs: [nome, senha]);
    }

}
