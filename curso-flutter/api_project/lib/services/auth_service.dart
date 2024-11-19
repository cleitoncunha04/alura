import 'dart:convert';
import 'dart:io';

import 'package:api_project/models/user.dart';
import 'package:api_project/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //TODO:
  static const String url = 'http://192.168.1.143:3000/';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  Future<bool> signIn(User user) async {
    http.Response response = await client.post(
      Uri.parse('${url}login'),
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode != 200) {
      String content = json.decode(response.body);

      switch (content) {
        case 'Cannot find user':
          throw UserNotFindedExecption();
        default:
          throw Exception(response.body);
      }
    }

    saveUserInfos(response.body);

    return true;
  }

  signUp(User user) async {
    http.Response response = await client.post(
      Uri.parse('${url}signup'),
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUserInfos(response.body);

    return true;
  }

  saveUserInfos(String body) async {
    Map<String, dynamic> map = json.decode(body);

    User user = User(
      accessToken: map['accessToken'],
      id: map['user']['id'],
      email: map['user']['email'],
    );

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('accessToken', user.accessToken!);
    sharedPreferences.setString('email', user.email);
    sharedPreferences.setInt('id', user.id!);
  }
}

class UserNotFindedExecption implements Exception {}
