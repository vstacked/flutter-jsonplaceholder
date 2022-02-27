import 'dart:convert';

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({this.userId, this.id, this.title, this.body});

  Map<String, dynamic> toMap() => {'userId': userId, 'id': id, 'title': title, 'body': body};

  factory Post.fromMap(Map<String, dynamic> map) =>
      Post(userId: map['userId'], id: map['id'], title: map['title'], body: map['body']);

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
