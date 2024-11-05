import 'dart:io';

import 'package:api_project/exceptions/transactions_exception.dart';
import 'package:api_project/models/transaction_model.dart';
import 'package:api_project/services/transactions_services.dart';
import 'package:http/http.dart';

class TransactionScreen {
  final TransactionsServices _transactionsServices = TransactionsServices();

  _getAllTrasactions() async {
    try {
      List<Transaction> transactions = await _transactionsServices.getAll();
      print(transactions);
    } on ClientException catch (clientException) {
      print("Não foi possível alcançar o servidor.");
      print("Tente novamente mais tarde.");
      print(clientException.message);
      print(clientException.uri);
    } on Exception {
      print("Não consegui recuperar os dados da conta.");
      print("Tente novamente mais tarde.");
    }
  }

  _addExampleTransaction() async {
    _transactionsServices
        .makeTransaction(
          idSender: "ID003",
          idReceiver: "ID002",
          amount: 5,
        )
        .catchError((e) => print(e.message),
            test: (error) => error is SenderNotExistsException)
        .catchError((e) => print(e.message),
            test: (error) => error is ReceiverNotExistsException)
        .catchError((e) {
          print(e.message);

          print(
              '${e.cause.name} is ${e.cause.balance} is lower than ${(e.amount + e.taxes)}');
        }, test: (error) => error is InsufficientAmountException)
        .catchError((e) => print(e), test: (error) => error is Exception)
        .then((value) {});
  }

  Future<void> runChatBot() async {
    print("Bom dia! Eu sou o Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ter aqui com a gente.\n");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - 👀 Ver todas as transações...");
      print("2 - ➕ Adicionar uma transação...");
      print("3 - Sair\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllTrasactions();
              break;
            }
          case "2":
            {
              await _addExampleTransaction();
              break;
            }
          case "3":
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
}
