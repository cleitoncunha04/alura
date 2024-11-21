import 'dart:convert';
import 'dart:io';

import 'package:api_project/models/user.dart';
import 'package:api_project/services/web_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String url = WebClient.url;
  http.Client client = WebClient().client;

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

  Future<bool> signUp(User user) async {
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

    SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    await asyncPrefs.setString('accessToken', user.accessToken!);
    await asyncPrefs.setString('email', user.email);
    await asyncPrefs.setInt('id', user.id!);
  }
}

class UserNotFindedExecption implements Exception {}
