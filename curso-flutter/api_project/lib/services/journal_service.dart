import 'dart:convert';

import 'package:api_project/models/journal.dart';
import 'package:api_project/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = 'http://192.168.1.143:3000/';
  static const String resource = 'journals/';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return url + resource;
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Journal> journals = [];

    for (var jsonMap in json.decode(response.body)) {
      journals.add(Journal.fromMap(jsonMap));
    }

    return journals;
  }

  Future<bool> post(Journal journal) async {
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {'Content-type': 'application/json'},
      body: json.encode(journal.toMap()),
    );

    return response.statusCode == 201;
  }

  Future<bool> put(String id, Journal journal) async {
    http.Response response = await client.put(
      Uri.parse('${getUrl()}$id'), // Passo a URL com o id para fazer o PUT
      headers: {'Content-type': 'application/json'},
      body: json.encode(journal.toMap()),
    );

    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    http.Response response = await client.delete(
      Uri.parse('${getUrl()}$id'), // Passo a URL com o id para fazer o DELETE
    );

    return response.statusCode == 200;
  }
}
