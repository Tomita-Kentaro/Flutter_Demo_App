import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'notification.dart';

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

  static Future<void> insertNotification(Notification notification) async {
    final db = await initDb();
    await db.insert(
      'notifications',
      notification.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// 他のCRUD操作（取得、更新、削除）も同様に実装
}
