import 'dart:convert';

class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      userId: json['userId']?.toInt() ?? 0,
      id: json['id']?.toInt() ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
