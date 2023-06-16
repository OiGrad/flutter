class AppEndPoints {
  // static const String baseUrl = 'http://www.kemeteg.live/';
  //192.168.137.133:8000/
  //192.168.1.94:8080
  static const String baseUrl = 'http://192.168.1.15:8000';
  //static const String baseUrl = 'http://192.168.1.5:8000/';
  // static const String baseUrl = 'https://58e9-197-36-209-110.ngrok-free.app/';
  //static const String baseUrl = 'https://fe80::4e61:c1c8:e751:ff87%4/';

  static const String signUp = '${baseUrl}/users/signup/';
  static const String login = '${baseUrl}/users/singin/';
  static const String token = '${baseUrl}/token/';

  static const String getCategory = '${baseUrl}/places/category/';
  static const String getPlaces = '${baseUrl}/places/';
  static const String getCities = '${baseUrl}/places/city/';

  static const String getPosts = '${baseUrl}/posts/post/';
  static String getComments(postId) {
    return '${baseUrl}/post/$postId/comments/';
    //TODO: remake it after backend update.
  }

  static String getPlace(placeId) {
    return '${baseUrl}/places/${placeId}';
  }

  static const String postComment = '${baseUrl}/comments/comments/';
  static const String searchPlaces = '${baseUrl}/places/search/';
}
