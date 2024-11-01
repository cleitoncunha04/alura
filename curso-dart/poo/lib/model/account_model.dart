abstract class Account {
  final String holder;
  double _balance;

  Account.constructor({required this.holder, required double initialBalance})
      : _balance = initialBalance;

  void withdrawal(double value) {
    if (value > 0 && value <= _balance) {
      _balance -= value;
      
      print('-R\$$value');
    } else {
      print('Invalid value...');
    }
  }

  void deposit(double value) {
    if (value > 0) {
      _balance += value;

      print('+R\$$value');
    } else {
      print('Invalid value...');
    }
  }

  double get balance => _balance;
}
