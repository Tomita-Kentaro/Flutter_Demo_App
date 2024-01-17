import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'notification.dart';

class NotificationProvider {
  static Future<void> insertNotification(Notification notification) async {
    final db = await DatabaseHelper.initDb();
    await db.insert(
      'notifications',
      notification.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Notification>> getNotifications() async {
    final db = await DatabaseHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('notifications');

    return List.generate(maps.length, (i) {
      return Notification(
        id: maps[i]['id'],
        date: maps[i]['date'],
        title: maps[i]['title'],
        message: maps[i]['message'],
      );
    });
  }

// 他のCRUD操作もここに追加
}