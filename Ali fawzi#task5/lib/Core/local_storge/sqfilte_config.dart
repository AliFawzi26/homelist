
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteConfg {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db;
    } else {
      return _db;
    }
  }

  initalDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'tasks.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("Database upgraded successfully");
  }

  _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE "tasks" (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT
      )
    """);
    print("Table tasks created successfully");
  }

  Future<List<Map>> readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql, List<Object?> params) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql, params);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  // إضافة مهمة جديدة
  Future<int> insertTask(String title, String description) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert("""
      INSERT INTO tasks (title, description)
      VALUES (?, ?)
    """, [title, description]);
    return response;
  }

  // جلب كل المهام
  Future<List<Map>> getAllTasks() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery("SELECT * FROM tasks");
    return response;
  }
}
