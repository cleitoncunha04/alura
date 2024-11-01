import 'package:poo/model/account_model.dart';
import 'package:poo/model/enterprise_account.dart';
import 'package:poo/model/investiment_account.dart';
import 'package:poo/model/saving_account_model.dart';

void main() {
  SavingAccount account =
      SavingAccount.constructor(holder: 'Mariazona', initialBalance: 2500.0);

  EnterpriseAccount enterpriseAccount = EnterpriseAccount.constructor(
      holder: 'Juraci Lanches', initialBalance: 5000);

  enterpriseAccount.withdrawal(1000);

  InvestimentAccount investimentAccount =
      InvestimentAccount.constructor(holder: 'Tigrinho', initialBalance: 1000);

  investimentAccount.deposit(1000);

  List<Account> accounts = <Account>[account, enterpriseAccount, investimentAccount];

  for (var account in accounts) {
    print('${account.holder}: R\$${account.balance}');
  }

  account.withdrawal(1800);

  print(account.balance);
}
