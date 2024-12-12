class BankModel {
  double available = 0;
  double spent = 0;
  double earned = 0;
  double points = 0;

  void deposit(double money) {
    if (money > 0) {
      available += money;
      earned += money;
      points += money;
    }
  }

  void transfer(double money) {
    if (money > 0 && available >= money) {
      available -= money;
      points += money;
      spent += money;
    }
  }
}
