class Account 
{
  final String holder;
  double _balance = 0;

  Account.constructor(this.holder);

  void withdrawal(double value) {
    if (value > 0 && value < _balance) {
      _balance -= value;
    }
  }
  
  void deposit(double value) {
    if(value > 0) {
      _balance += value;
    }
  }

  double getBalance() {
    return _balance;
  }
}