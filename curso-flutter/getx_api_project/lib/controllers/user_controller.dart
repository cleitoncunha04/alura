import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api_project/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UserConroller extends GetxController {
  final Logger _logger = Logger();

  Future<bool> register({
    required String user,
    required String email,
    required String password,
  }) async {
    bool isCreated = false;

    Map<String, String> headers = {"Content-Type": "application/json"};

    Uri uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.register);

    Map<String, String> body = {
      "user": user,
      "email": email,
      "password": password
    };

    _logger.i(body);

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        _logger.i(
          jsonDecode(response.body),
        );

        isCreated = true;
      } else {
        throw http.ClientException(
          jsonDecode(response.body),
        );
      }
    } catch (e) {
      _logger.e(e);
    }

    return isCreated;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    bool isCreated = false;

    Map<String, String> headers = {"Content-Type": "application/json"};

    Uri uri = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login);

    Map<String, String> body = {"email": email, "password": password};

    _logger.i(body);

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _logger.i(
          jsonDecode(response.body),
        );

        GetStorage().write(
          "session",
          jsonDecode(response.body),
        );

        isCreated = true;
      } else {
        throw http.ClientException(
          jsonDecode(response.body),
        );
      }
    } catch (e) {
      _logger.e(e);
    }

    return isCreated;
  }
}
