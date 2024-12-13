# Types of Inheritance in Dart

## 1. Single Inheritance
Dart supports single inheritance where a class can only extend one parent class.

```dart
class Animal {
  void breathe() => print('Breathing');
}

class Dog extends Animal {
  void bark() => print('Barking');
}
```

## 2. Multiple Interface Implementation
While Dart doesn't support multiple inheritance directly, a class can implement multiple interfaces.

```dart
abstract class Swimmable {
  void swim();
}

abstract class Flyable {
  void fly();
}

// Implementing multiple interfaces
class Duck implements Swimmable, Flyable {
  @override
  void swim() => print('Duck swimming');
  
  @override
  void fly() => print('Duck flying');
}
```

## 3. Hierarchical Inheritance
One parent class has multiple child classes.

```dart
class Vehicle {
  void start() => print('Starting vehicle');
}

class Car extends Vehicle {
  void drive() => print('Driving car');
}

class Bike extends Vehicle {
  void pedal() => print('Pedaling bike');
}
```

## 4. Multilevel Inheritance
Creating a chain of inheritance.

```dart
class Animal {
  void breathe() => print('Breathing');
}

class Mammal extends Animal {
  void feed() => print('Feeding milk');
}

class Dog extends Mammal {
  void bark() => print('Barking');
}
```

## 5. Mixin Inheritance
Using mixins to share code between different class hierarchies.

```dart
mixin Logger {
  void log(String msg) => print('Log: $msg');
}

mixin EmailSender {
  void sendEmail(String msg) => print('Sending email: $msg');
}

class NotificationService with Logger, EmailSender {
  void notify() {
    log('Sending notification');
    sendEmail('Hello!');
  }
}
```

## 6. Implicit Interface Inheritance
Every class in Dart implicitly defines an interface.

```dart
class Printer {
  void print() => print('Printing');
}

// Using normal class as interface
class CustomPrinter implements Printer {
  @override
  void print() => print('Custom printing');
}
```

## 7. Combined Inheritance
Combining different types of inheritance.

```dart
abstract class Machine {
  void start();
}

mixin ElectricPowered {
  void charge() => print('Charging');
}

class Vehicle {
  void move() => print('Moving');
}

// Combining extends, with, and implements
class ElectricCar extends Vehicle with ElectricPowered implements Machine {
  @override
  void start() => print('Starting electric car');
}
```

## 8. Abstract Class Inheritance
Inheriting from abstract classes.

```dart
abstract class Shape {
  double calculateArea();
  
  // Abstract classes can have implemented methods
  void describe() => print('This is a shape');
}

class Circle extends Shape {
  final double radius;
  
  Circle(this.radius);
  
  @override
  double calculateArea() => 3.14 * radius * radius;
}
```

## Important Notes:

1. **Inheritance Restrictions**:
   - Can only extend one class
   - Can implement multiple interfaces
   - Can use multiple mixins
   
2. **Method Resolution Order**:
   - For mixins: rightmost mixin wins
   - Child class overrides parent class
   - Implementation overrides everything

3. **Best Practices**:
   ```dart
   // Good: Clear inheritance hierarchy
   class Animal {}
   class Mammal extends Animal {}
   class Dog extends Mammal {}

   // Bad: Deep inheritance chains
   class A {}
   class B extends A {}
   class C extends B {}
   class D extends C {} // Too deep!
   ```

4. **Super Constructor Calls**:
   ```dart
   class Parent {
     Parent(String name);
   }

   class Child extends Parent {
     Child(String name) : super(name);
   }
   ```

## Common Pitfalls to Avoid:

1. **Overusing Inheritance**:
```dart
// Bad: Using inheritance for unrelated functionality
class Database extends Logger {} // Wrong relationship

// Better: Use composition
class Database {
  final logger = Logger();
}
```

2. **Forgetting Abstract Method Implementation**:
```dart
abstract class Drawable {
  void draw();
}

// Compilation error: Missing draw() implementation
class Square extends Drawable {
  // Must implement draw()
}
```

3. **Deep Inheritance Chains**:
```dart
// Avoid deep inheritance chains
class A extends B {}      // Level 1
class B extends C {}      // Level 2
class C extends D {}      // Level 3
class D extends E {}      // Level 4 - Too deep!
```