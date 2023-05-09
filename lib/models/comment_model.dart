import 'package:flutter/gestures.dart';
import 'package:kemet/models/user_hint.dart';

class Comment {
  int id;
  String userName;
  String comment;
  int commentedAt;
  bool hasReplays;

  Comment({
    required this.id,
    required this.userName,
    required this.comment,
    required this.commentedAt,
    required this.hasReplays,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: int.parse(json['id']),
      userName: json['user'],
      comment: json['comment'],
      commentedAt: json['commentedAt'],
      hasReplays: json['hasReplays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userName,
      'comment': comment,
      'commentedAt': commentedAt,
      'hasReplays': hasReplays,
    };
  }
}
