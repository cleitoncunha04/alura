import 'dart:io';

import 'package:api_project/models/account_model.dart';
import 'package:api_project/services/account_service.dart';
import 'package:http/http.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializaeStream() {
    _accountService.streamInfos.listen((info) => print(info));
  }

  Future<void> _getAllAccounts() async {
    print(await _accountService.getAll());
  }

  _addExampleAccount() async {
    AccountModel example = AccountModel.constructor(
        id: 'EX001', name: 'Bernardo', lastName: 'Silva', balance: 5000);

        await _accountService.add(example);
  }

  void runChatBot() async {
    print('Welcome!\nMi nombre is Carlitos, I am your Bank Assistance');

    bool isRuning = true;

    while (isRuning) {
      print(
          'How can I help you?\n1- See all accounts\n2- Find an account by its ID\n3- Add a new account\n4- Remove an existent account\n5- Quit');

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case '1':
            await _getAllAccounts();

            break;
          case '2':
            break;
          case '3':
            await _addExampleAccount();

            break;
          case '4':
            break;
          case '5':
            isRuning = false;

            print('See you later...');

            break;
          default:
            print('Select a valid option...');
        }
      }
    }
  }
}
