import 'package:flutter_test/flutter_test.dart';
import 'package:tests_project/models/bank.dart';

void main() {
  group('BankModel deposit tests', () {
    test(
      'Bank model deposit should turn points into 10',
      () {
        final BankModel bank = BankModel();

        bank.deposit(10);

        expect(bank.points, 10);
      },
    );

    test('Bank model deposit should turn available into 10', () {
      final bank = BankModel();

      bank.deposit(10);

      expect(bank.available, 10);
    });

    test('Bank model deposit should turn earned into 10', () {
      final bank = BankModel();

      bank.deposit(10);

      expect(bank.earned, 10);
    });

    test(
        'Bank model deposit should not run, not changing any value (amount < 0)',
        () {
      final bank = BankModel();

      bank.deposit(-10);

      expect(bank.points, 0);
      expect(bank.earned, 0);
      expect(bank.available, 0);
    });
  });

  group('BankModel transfer tests', () {
    test(
        'Bank model transfer should not run, not changing any value (amount < 0)',
        () {
      final bank = BankModel();

      bank.transfer(-10);

      expect(bank.available, 0);
      expect(bank.points, 0);
      expect(bank.spent, 0);
    });

    test(
        'Bank model transfer should not run, not changing any value (balance < amount)',
        () {
      final bank = BankModel();

      bank.transfer(10);

      expect(bank.available, 0);
      expect(bank.points, 0);
      expect(bank.spent, 0);
    });

    test('Bank model deposit and transfer should turn points into 10', () {
      final bank = BankModel();

      bank.deposit(10);

      bank.transfer(10);

      expect(bank.points, 20);
    });

    test('Bank model deposit and transfer should turn available into 0', () {
      final bank = BankModel();

      bank.deposit(10);

      bank.transfer(10);

      expect(bank.available, 0);
    });

    test('Bank model deposit and transfer should turn spent into 10', () {
      final bank = BankModel();

      bank.deposit(10);

      bank.transfer(10);

      expect(bank.spent, 10);
    });
  });
}
