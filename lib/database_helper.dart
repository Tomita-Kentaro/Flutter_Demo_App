import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'notification.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notifications(id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, title TEXT, message TEXT)',
        );
      },
      version: 1,
    );
  }
}