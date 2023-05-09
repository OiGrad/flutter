class Post {
  int id;
  var postedAt;
  String userName;
  int commentsCount;
  //TODO: add postContent
  Post(
      {required this.id,
      required this.userName,
      required this.postedAt,
      required this.commentsCount});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userName: json['userName'],
      postedAt: json['postedAt'],
      commentsCount: json['commentsCount'],
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
