import 'dart:async';
import 'package:api_project/api_key.dart';
import 'package:api_project/models/account_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  final String _url =
      'https://api.github.com/gists/c337e191204677fc4698ab40d7eac086';

  Stream<String> get streamInfos => _streamController.stream;

  Future<List<Account>> getAll() async {
    Response response = await get(Uri.parse(_url));

    _streamController.add('${DateTime.now()} | GET: ${response.statusCode}');

    Map<String, dynamic> mapResponse = json.decode(response.body);

    List<dynamic> listDynamic =
        json.decode(mapResponse['files']['accounts.json']['content']);

    List<Account> accounts = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;

      Account account = Account.fromMap(mapAccount);

      accounts.add(account);
    }

    return accounts;
  }

  addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);
    save(listAccounts, accountName: account.name);
  }

  save(List<Account> listAccounts, {String accountName = ""}) async {
    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }
    String content = json.encode(listContent);

    Response response = await post(Uri.parse(_url),
        headers: {
          'Authorization': 'Bearer $gistApiKey',
        },
        body: json.encode({
          'description': 'accounts.json',
          'public': true,
          'files': {
            'accounts.json': {'content': content}
          }
        }));

    _streamController.add(
        '${DateTime.now()} | POST (add): ${response.statusCode}');

    await Future.delayed(Duration(milliseconds: 100));

    return response;
  }
}
