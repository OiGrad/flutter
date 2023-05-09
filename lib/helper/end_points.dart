class AppEndPoints {
  static const String baseUrl = 'http://192.168.1.5:8000/';

  static const String signUp = '${baseUrl}users/signup/';
  static const String login = '${baseUrl}users/singin';

  static const String getCategory = '${baseUrl}places/category/';
  static const String getPlaces = '${baseUrl}places/';
  static const String getCities = '${baseUrl}places/city/';

  static const String getPosts = '${baseUrl}posts/post/';
  static String getComments(postId) {
    return '${baseUrl}posts/post/$postId/comments/';
    //TODO: remake it after backend update.
  }
}
