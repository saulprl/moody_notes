import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'posts.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE posts(post_id TEXT PRIMARY KEY, post_path TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> fetchData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> update(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return await db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  static Future<int> delete(String table, String id) async {
    final db = await DBHelper.database();
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
