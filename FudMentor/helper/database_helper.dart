import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'mentee_mentor.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE mentees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        registrationNumber TEXT
      )
    ''');

    // Add student registration numbers FCP/CSC/18/0001 to FCP/CSC/18/0100
    for (int i = 1; i <= 100; i++) {
      String registrationNumber = 'FCP/CSC/18/${i.toString().padLeft(4, '0')}';
      await db.insert('mentees', {'registrationNumber': registrationNumber});
    }

    await db.execute('''
      CREATE TABLE mentors (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        registrationNumber TEXT
      )
    ''');

    // Add mentor with staff ID FCP/STAFF/100
    await db.insert('mentors', {'registrationNumber': 'FCP/STAFF/100'});
  }

  Future<int> insertMentee(String registrationNumber) async {
    Database db = await database;
    return await db
        .insert('mentees', {'registrationNumber': registrationNumber});
  }

  Future<int> insertMentor(String registrationNumber) async {
    Database db = await database;
    return await db
        .insert('mentors', {'registrationNumber': registrationNumber});
  }

  Future<List<Map<String, dynamic>>> getAllMentees() async {
    Database db = await database;
    return await db.query('mentees');
  }

  Future<List<Map<String, dynamic>>> getAllMentors() async {
    Database db = await database;
    return await db.query('mentors');
  }
}
