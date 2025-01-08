class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'http://192.168.1.143:3000/';
  
  static const String register = 'register';
  
  static const String login = 'login';
  
  static const String videos = 'videos';

  static const String addVideoByUser = '600/videos';

  List<Map<String, dynamic>> users = [];
}