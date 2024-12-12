import 'package:flutter/material.dart';
import 'package:tests_project/models/bank.dart';

class BankProvider extends ChangeNotifier {
  BankProvider({
    required this.bank,
  });

  final BankModel bank;

  void deposit(double money) {
    bank.deposit(money);

    notifyListeners();
  }

  void transfer(double money) {
    bank.transfer(money);

    notifyListeners();
  }
}
