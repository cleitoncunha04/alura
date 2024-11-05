import 'dart:io';

import 'package:api_project/models/account_model.dart';
import 'package:api_project/screens/transaction_screen.dart';
import 'package:api_project/services/account_service.dart';
import 'package:http/http.dart';


class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen(
      (event) {
        print(event);
      },
    );
  }

  _openTransactionScreen() async {
    TransactionScreen ts = TransactionScreen();

    await ts.runChatBot();
  }

  void runChatBot() async {
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ter aqui com a gente.\n");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - 👀 Ver todas sua contas.");
      print("2 - ➕ Adicionar nova conta.");
      print("3 - ➕ Adicionar uma transação.");
      print("4 - Sair\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExampleAccount();
              break;
            }
          case '3': 
          {
            await _openTransactionScreen();
            break;
          }
          case "4":
            {
              isRunning = false;
              print("Te vejo na próxima. 👋");
              break;
            }
          default:
            {
              print("Não entendi. Tente novamente.");
            }
        }
      }
    }
  }

  _getAllAccounts() async {
    try {
      List<Account> listAccounts = await _accountService.getAll();
      print(listAccounts);
    } on ClientException catch (clientException) {
      print("Não foi possível alcançar o servidor.");
      print("Tente novamente mais tarde.");
      print(clientException.message);
      print(clientException.uri);
    } on Exception {
      print("Não consegui recuperar os dados da conta.");
      print("Tente novamente mais tarde.");
    } finally {
      print("${DateTime.now()} | Ocorreu uma tentativa de consulta.");
      // Aqui vai rodar antes de fechar.
    }
    // Aqui não vai rodar antes de fechar.
  }

  _addExampleAccount() async {
    try {
      Account example = Account(
        id: "ID555",
        name: "Haley",
        lastName: "Chirívia",
        balance: 8001,
        accountType: "Brigadeiro",
      );

      await _accountService.addAccount(example);
    } on Exception {
      print("Ocorreu um problema ao tentar adicionar.");
    }
  }
}
