import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database_helper.g.dart';

class DatabaseHelper {
  static const _dbName = 'guivo.db';
  static const _dbVersion = 4;

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE student_profiles (
      uid TEXT PRIMARY KEY,
      nome TEXT NOT NULL,
      email TEXT NOT NULL,
      data_nascimento TEXT,
      genero TEXT,
      provincia TEXT,
      escola TEXT,
      classe TEXT,
      area_estudo TEXT,
      interesses TEXT,
      onboarding_completo INTEGER NOT NULL DEFAULT 0,
      criado_em TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE quiz_sessions (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL,
      iniciado_em TEXT NOT NULL,
      completado_em TEXT,
      respostas TEXT NOT NULL DEFAULT '{}',
      resultados TEXT NOT NULL DEFAULT '{}'
    )
  ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS quiz_sessions (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        iniciado_em TEXT NOT NULL,
        completado_em TEXT,
        respostas TEXT NOT NULL DEFAULT '{}',
        resultados TEXT NOT NULL DEFAULT '{}'
      )
    ''');
    }
    if (oldVersion < 3) {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS favorites (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        item_id TEXT NOT NULL,
        tipo TEXT NOT NULL,
        criado_em TEXT NOT NULL,
        nome TEXT,
        emoji TEXT,
        area TEXT
      )
    ''');
    }
    if (oldVersion < 4) {
      await db.execute(
        'ALTER TABLE quiz_sessions ADD COLUMN tipo TEXT NOT NULL DEFAULT "riasec"',
      );
    }
  }
}

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(Ref ref) => DatabaseHelper();
