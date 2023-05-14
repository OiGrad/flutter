import 'dart:convert';

class Post {
  int id;
  var postedAt;
  String userName;
  String commentsCount;
  List content;
  //TODO: add postContent
  Post({
    required this.id,
    required this.userName,
    required this.postedAt,
    required this.commentsCount,
    required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> _json) {
    return Post(
      id: _json['id'],
      userName: _json['user']['username'],
      postedAt: _json['created_at'],
      commentsCount: '?', //json['commentsCount'] as String
      content: json.decode(_json['body'].toString().replaceAll("'", '"')),
    );
  }
  toJson() {
    return {
      'id': id,
      'userName': userName,
      'postedAt': postedAt,
      'commentsCount': commentsCount,
    };
  }
}
