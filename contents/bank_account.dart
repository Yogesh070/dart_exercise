class BankAccount {
  String accountNumber;
  String accountHolderName;
  double _balance;

  BankAccount(this.accountNumber, this.accountHolderName, this._balance);

  void deposit(double amount) {
    _balance += amount;
  }

  // double get balance => _balance;

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    } else {
      print('Insufficient _balance');
    }
  }

  void display() {
    print('Account Number: $accountNumber');
    print('Account Holder Name: $accountHolderName');
    print('Balance: $_balance');
  }
}
