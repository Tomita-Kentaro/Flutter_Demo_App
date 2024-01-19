// add_notification_screen.dart
import 'package:flutter/material.dart';
import '../notification.dart' as notif;
import '../database_helper.dart';

class AddNotificationScreen extends StatefulWidget {
  @override
  _AddNotificationScreenState createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _addNotification() {
    final notification = notif.Notification(
      date: _dateController.text,
      title: _titleController.text,
      message: _messageController.text,
    );

    DatabaseHelper.insertNotification(notification).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            ElevatedButton(
              onPressed: _addNotification,
              child: Text('Add Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
