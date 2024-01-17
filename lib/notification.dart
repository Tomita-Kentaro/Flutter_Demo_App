class Notification {
  final int? id;
  final String date;
  final String title;
  final String message;

  Notification({this.id, required this.date, required this.title, required this.message});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'title': title,
      'message': message,
    };
  }
}