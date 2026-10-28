import 'package:test/test.dart';
import '../lib/bank_account.dart';

void main() {
  group('BankAccount Encapsulation & Exception Tests', () {
    test('Account initializes correctly with valid data', () {
      var account = BankAccount(owner: 'Nathan Papa', initialBalance: 1500.0);
      expect(account.owner, equals('Nathan Papa'));
      expect(account.balance, equals(1500.0));
    });

    test('Deposit increases balance and rejects non-positive amounts', () {
      var account = BankAccount(owner: 'Kofi', initialBalance: 100.0);
      account.deposit(50.0);
      expect(account.balance, equals(150.0));

      expect(() => account.deposit(0), throwsArgumentError);
      expect(() => account.deposit(-20), throwsArgumentError);
    });

    test('Withdraw decreases balance and throws InsufficientFundsException on overdraft', () {
      var account = BankAccount(owner: 'Yaw', initialBalance: 500.0);
      account.withdraw(200.0);
      expect(account.balance, equals(300.0));

      // Overdraft attempt
      expect(() => account.withdraw(600.0), throwsA(isA<InsufficientFundsException>()));
    });

    test('Invalid constructor data throws ArgumentError', () {
      expect(() => BankAccount(owner: '', initialBalance: 100), throwsArgumentError);
      expect(() => BankAccount(owner: 'Valid Name', initialBalance: -50), throwsArgumentError);
    });
  });
}
