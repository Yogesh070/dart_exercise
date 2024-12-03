// 1. Basic Class Definition
class Student {
  // TODO: Add properties for name, age, and grades (List<int>)
  // TODO: Add a constructor
  // TODO: Add a method to calculate average grade
  // TODO: Add toString method
}

// 2. Private Properties and Getters/Setters
class BankAccount {
  // TODO: Add private property _balance
  // TODO: Add getter for balance
  // TODO: Add setter that prevents negative balance
  // TODO: Add methods deposit() and withdraw()
}

// 3. Named Constructor and Factory
class Point {
  // TODO: Add properties x and y
  // TODO: Add default constructor
  // TODO: Add named constructor 'fromJson'
  // TODO: Add factory constructor that creates a Point from a string "x,y"
}

// 4. Inheritance
class Animal {
  // TODO: Add properties name and age
  // TODO: Add makeSound() method
}

class Dog extends Animal {
  // TODO: Add property breed
  // TODO: Override makeSound() method
  // TODO: Add a specific method playFetch()
}

// 5. Abstract Class and Interface
abstract class Shape {
  // TODO: Add abstract methods calculateArea() and calculatePerimeter()
}

class Rectangle implements Shape {
  // TODO: Implement Shape methods
  // TODO: Add properties width and height
}

class Circle implements Shape {
  // TODO: Implement Shape methods
  // TODO: Add property radius
}

// 6. Mixins
mixin Logger {
  // TODO: Add log() method that prints messages with timestamps
}

class DatabaseService with Logger {
  // TODO: Add methods that use the logger
}

// 7. Static Members
class MathUtils {
  // TODO: Add static methods for common math operations
  // TODO: Add static constant for PI
}

// 8. Immutable Class
class ImmutablePoint {
  // TODO: Create an immutable class with final properties
  // TODO: Add const constructor
}

// 9. Class with Generic Type
class Stack<T> {
  // TODO: Implement a generic stack with push(), pop(), and peek() methods
}

// 10. Extension Method
extension StringUtils on String {
  // TODO: Add methods to capitalize first letter and count words
}

// Test all classes
void main() {
  // Test 1: Student Class
  print('\nTesting Student Class:');
  // TODO: Create student instances and test methods

  // Test 2: BankAccount Class
  print('\nTesting BankAccount Class:');
  // TODO: Test deposit, withdrawal, and balance validation

  // Test 3: Point Class
  print('\nTesting Point Class:');
  // TODO: Test different constructors

  // Test 4: Inheritance
  print('\nTesting Inheritance:');
  // TODO: Create and test Dog instances

  // Test 5: Shape Implementation
  print('\nTesting Shapes:');
  // TODO: Test Rectangle and Circle classes

  // Test 6: Mixin Usage
  print('\nTesting Logger Mixin:');
  // TODO: Test DatabaseService with Logger

  // Test 7: Static Members
  print('\nTesting Static Members:');
  // TODO: Test MathUtils methods

  // Test 8: Immutable Class
  print('\nTesting Immutable Point:');
  // TODO: Test ImmutablePoint

  // Test 9: Generic Stack
  print('\nTesting Generic Stack:');
  // TODO: Test Stack with different types

  // Test 10: String Extension
  print('\nTesting String Extension:');
  // TODO: Test string utility methods
}

// Here's a solution example for one class to get you started:
class CompletedExample {
  final String name;
  int _age;

  CompletedExample(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      throw ArgumentError('Age cannot be negative');
    }
  }

  @override
  String toString() => 'CompletedExample(name: $name, age: $_age)';
}
