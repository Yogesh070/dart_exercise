# Object-Oriented Programming in Dart

## 1. Classes and Objects

### Definition
A class is a blueprint for creating objects that have similar properties and methods. An object is an instance of a class.

### Example
```dart
class Car {
  String brand;
  String model;
  int year;

  // Constructor
  Car(this.brand, this.model, this.year);

  // Method
  void startEngine() {
    print('The $brand $model\'s engine is starting...');
  }
}

void main() {
  // Creating an object
  var myCar = Car('Toyota', 'Camry', 2024);
  myCar.startEngine();
}
```

## 2. Encapsulation

### Definition
Encapsulation is the bundling of data and the methods that operate on that data within a single unit (class), restricting direct access to some of an object's components.

### Example
```dart
class BankAccount {
  String _accountHolder;  // Private variable
  double _balance;        // Private variable

  BankAccount(this._accountHolder) : _balance = 0.0;

  // Getter
  double get balance => _balance;
  String get accountHolder => _accountHolder;

  // Methods to manipulate private data
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited $amount. New balance: $_balance');
    }
  }

  bool withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawn $amount. New balance: $_balance');
      return true;
    }
    print('Insufficient funds');
    return false;
  }
}

void main() {
  var account = BankAccount('John Doe');
  account.deposit(1000);
  // Can't access _balance directly: account._balance (will cause error)
  print('Current balance: ${account.balance}');
}
```

## 3. Inheritance

### Definition
Inheritance allows a class to inherit properties and methods from another class, promoting code reuse and establishing a relationship between parent and child classes.

### Example
```dart
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Some generic sound');
  }
}

class Dog extends Animal {
  String breed;
  
  // Super constructor
  Dog(String name, this.breed) : super(name);
  
  // Method overriding
  @override
  void makeSound() {
    print('$name the $breed: Woof!');
  }
  
  // Additional method
  void fetch() {
    print('$name is fetching the ball');
  }
}

void main() {
  var dog = Dog('Max', 'Golden Retriever');
  dog.makeSound();  // Calls overridden method
  dog.fetch();      // Calls Dog-specific method
}
```

## 4. Polymorphism

### Definition
Polymorphism allows objects of different classes to be treated as objects of a common base class, enabling different objects to respond differently to the same method call.

### Example
```dart
abstract class Shape {
  double calculateArea();
  double calculatePerimeter();
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
  
  @override
  double calculatePerimeter() {
    return 2 * 3.14 * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  @override
  double calculateArea() {
    return width * height;
  }
  
  @override
  double calculatePerimeter() {
    return 2 * (width + height);
  }
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6)
  ];
  
  // Polymorphic behavior
  for (var shape in shapes) {
    print('Area: ${shape.calculateArea()}');
    print('Perimeter: ${shape.calculatePerimeter()}\n');
  }
}
```

## 5. Abstraction

### Definition
Abstraction is the process of hiding complex implementation details and showing only the necessary features of an object, typically achieved through abstract classes and interfaces.

### Example
```dart
// Abstract class
abstract class Database {
  void connect();
  void disconnect();
  void query(String sql);
}

// Implementation
class MySQLDatabase implements Database {
  @override
  void connect() {
    print('Connecting to MySQL database...');
  }
  
  @override
  void disconnect() {
    print('Disconnecting from MySQL database...');
  }
  
  @override
  void query(String sql) {
    print('Executing MySQL query: $sql');
  }
}

// Another implementation
class PostgreSQLDatabase implements Database {
  @override
  void connect() {
    print('Connecting to PostgreSQL database...');
  }
  
  @override
  void disconnect() {
    print('Disconnecting from PostgreSQL database...');
  }
  
  @override
  void query(String sql) {
    print('Executing PostgreSQL query: $sql');
  }
}

void main() {
  Database db = MySQLDatabase();
  db.connect();
  db.query('SELECT * FROM users');
  db.disconnect();
  
  // Can easily switch to different database implementation
  db = PostgreSQLDatabase();
  db.connect();
  db.query('SELECT * FROM users');
  db.disconnect();
}
```

## 6. Advanced OOP Concepts in Dart

### Mixins
```dart
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class DataService with Logger {
  void fetchData() {
    log('Fetching data...');
    // Fetch data implementation
  }
}
```

### Factory Constructors
```dart
class Configuration {
  final String environment;
  static final Map<String, Configuration> _cache = {};
  
  factory Configuration(String env) {
    return _cache.putIfAbsent(
      env,
      () => Configuration._internal(env)
    );
  }
  
  Configuration._internal(this.environment);
}
```

These examples demonstrate the core principles of OOP in Dart, showing how each concept can be implemented practically. The code samples progress from basic to more advanced concepts, illustrating how these principles work together to create well-structured, maintainable code.