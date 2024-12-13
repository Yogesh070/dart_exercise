import 'bank_account.dart';

void main(List<String> args) {
  BankAccount account = BankAccount('10022211', 'Yogesh', 1000);
  account.deposit(100);
  account.display();

  //Next
  var dog = Dog('Tommy', 'Black');

  Cat cat = Cat('Memmm', 'Red');
  dog.showName();
  dog.speak();

  cat.showName();
  cat.speak();
}

class Animal {
  String name;
  String color;
  Animal(this.name, this.color);

  void showName() {
    print(name);
  }

  void speak() {
    print('Animal speaks');
  }
}

class Dog extends Animal {
  // Dog(String name,String color) : super(name,color);
  Dog(super.name, super.color);

  @override
  void showName() {
    super.showName();
    print('Dog name is $name');
  }

  @override
  void speak() {
    print('Dog barks');
  }
}

class Cat extends Animal {
  Cat(String name, String color) : super(name, color);

  @override
  void showName() {
    print('Cat name is $name');
  }

  @override
  void speak() {
    print('Cat meows');
  }
}
