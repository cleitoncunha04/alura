// Conta poupança

import 'package:poo/model/account_model.dart';

class SavingAccount extends Account {
  static double yieldAmount = 0.05;
  
  SavingAccount.constructor({required super.holder, required super.initialBalance}) : super.constructor();
  
  void calcYieldAmount() {
    double currentBalance = balance;

    currentBalance += currentBalance * yieldAmount;

    deposit(currentBalance - balance); // A MERDA DO DART NÃO TEM O TIPO PROTECTED, ENTÃO NÃO CONSIGO ACESSAR UM ATRIBUTO PRIVADO DA CLASSE PAI --> FILHOS DA P...
  }
}