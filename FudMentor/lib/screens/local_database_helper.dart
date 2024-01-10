import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();

  factory LocalDatabaseHelper() => _instance;

  LocalDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'local_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE mentees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT,
        email TEXT,
        level TEXT,
        gender TEXT
      )
    ''');

    // Insert sample mentee data
    await db.insert('mentees', {
      'name': 'John Doe',
      'phone': '123-456-7890',
      'email': 'john.doe@example.com',
      'level': 'Undergraduate',
      'gender': 'Male',
    });

    // Add more sample data as needed
  }

  Future<void> insertMentee(Map<String, dynamic> mentee) async {
    Database db = await database;
    await db.insert('mentees', mentee);
  }

  Future<Map<String, dynamic>> getMenteeDetails(String menteeName) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('mentees',
        where: 'name = ?', whereArgs: [menteeName], limit: 1);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      throw Exception('Mentee not found');
    }
  }
}
