import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final items = [['2024/01/01 11:00','aaaaaaaaaaaaaaaaaaaaa'],
                ['2024/01/02 12:00','bbbbbbbbbbbbbbbbbbbbb'],
                ['2024/01/03 13:00','cccccccccccccccccccccc']];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new Notification'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Alert List',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length, // 通知の数に応じて変更してください
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index][0]}'),
                  subtitle: Text('${items[index][1]}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // ここに詳細ボタンを押したときのロジックを追加します
                    },
                    child: Text('確認'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
