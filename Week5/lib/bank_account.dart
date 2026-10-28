// Custom Exception for Insufficient Funds
class InsufficientFundsException implements Exception {
  final String message;
  InsufficientFundsException([this.message = 'Insufficient funds for this transaction.']);
  
  @override
  String toString() => 'InsufficientFundsException: $message';
}

class BankAccount {
  String _owner;
  double _balance;

  BankAccount({required String owner, double initialBalance = 0.0})
      : _owner = owner.trim(),
        _balance = initialBalance {
    if (_owner.isEmpty) {
      throw ArgumentError('Account owner name cannot be empty.');
    }
    if (_balance < 0) {
      throw ArgumentError('Initial balance cannot be negative.');
    }
  }

  // Getters
  String get owner => _owner;
  double get balance => _balance;

  // Setter for owner with validation
  set owner(String newOwner) {
    if (newOwner.trim().isEmpty) {
      throw ArgumentError('Owner name cannot be empty.');
    }
    _owner = newOwner.trim();
  }

  // Deposit method
  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Deposit amount must be greater than zero.');
    }
    _balance += amount;
  }

  // Withdraw method with exception handling
  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Withdrawal amount must be greater than zero.');
    }
    if (amount > _balance) {
      throw InsufficientFundsException('Attempted to withdraw $amount with current balance $_balance.');
    }
    _balance -= amount;
  }
}
