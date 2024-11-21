import 'dart:convert';
import 'dart:io';

import 'package:api_project/models/journal.dart';
import 'package:api_project/services/web_client.dart';
import 'package:http/http.dart' as http;

class JournalService {
  String url = WebClient.url;
  static const String resource = 'journals/';
  http.Client client = WebClient().client;

  String getUrl() {
    return url + resource;
  }

  Future<List<Journal>> getAll({
    required String token,
    required int id,
  }) async {
    http.Response response = await client.get(
      Uri.parse('${url}users/$id/journals'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      } else {
        throw HttpException(response.body);
      }
    }

    List<Journal> journals = [];

    for (var jsonMap in json.decode(response.body)) {
      journals.add(Journal.fromMap(jsonMap));
    }

    return journals;
  }

  Future<bool> post(String token, Journal journal) async {
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
      body: json.encode(journal.toMap()),
    );

    if (response.statusCode != 201) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      } else {
        throw HttpException(response.body);
      }
    }

    return true;
  }

  Future<bool> put(String token, String id, Journal journal) async {
    journal.updatedAt = DateTime.now();
    
    http.Response response = await client.put(
      Uri.parse('${getUrl()}$id'), // Passo a URL com o id para fazer o PUT
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json'
      },
      body: json.encode(journal.toMap()),
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      } else {
        throw HttpException(response.body);
      }
    }

    return true;
  }

  Future<bool> delete(String id, String token) async {
    http.Response response = await client.delete(
      Uri.parse('${getUrl()}$id'), // Passo a URL com o id para fazer o DELETE
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      } else {
        throw HttpException(response.body);
      }
    }

    return true;
  }
}

class TokenNotValidException implements Exception {}
