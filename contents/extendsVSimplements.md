# Understanding `extends` vs `implements` in Dart

## Table of Contents
- [Understanding `extends` vs `implements` in Dart](#understanding-extends-vs-implements-in-dart)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [The extends Keyword](#the-extends-keyword)
    - [Key Features](#key-features)
    - [Example](#example)
  - [The implements Keyword](#the-implements-keyword)
    - [Key Features](#key-features-1)
    - [Example](#example-1)
  - [Key Differences](#key-differences)
  - [Combining extends and implements](#combining-extends-and-implements)
  - [Best Practices](#best-practices)
  - [Code Examples](#code-examples)
    - [Complete Implementation Example](#complete-implementation-example)
  - [Final Notes](#final-notes)

## Introduction
In Dart, both `extends` and `implements` are used for inheritance, but they serve different purposes and have distinct behaviors. This guide explains their differences and use cases.

## The extends Keyword
`extends` is used for single inheritance, allowing a class to inherit properties and methods from a parent class.

### Key Features
- Single inheritance (can only extend one class)
- Inherits both method signatures and implementations
- Can access parent members using `super`
- Can override parent methods selectively
- Automatically inherits constructor

### Example
```dart
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('Generic animal sound');
  }
  
  void eat() {
    print('$name is eating');
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('$name says: Woof!');
  }
  
  // Can add new methods
  void fetch() {
    print('$name is fetching');
  }
}
```

## The implements Keyword
`implements` is used to create a contract that a class must fulfill, similar to interfaces in other languages.

### Key Features
- Multiple implementation (can implement many interfaces)
- Must implement ALL methods from interfaces
- No access to original implementation
- Cannot use `super`
- Must provide own implementation for every method

### Example
```dart
abstract class Swimmer {
  void swim();
  void dive();
}

abstract class Flyer {
  void fly();
  void land();
}

class Duck implements Swimmer, Flyer {
  String name;
  
  Duck(this.name);
  
  @override
  void swim() {
    print('$name is swimming');
  }
  
  @override
  void dive() {
    print('$name is diving');
  }
  
  @override
  void fly() {
    print('$name is flying');
  }
  
  @override
  void land() {
    print('$name is landing');
  }
}
```

## Key Differences

| Feature | extends | implements |
|---------|---------|------------|
| Inheritance Type | Single | Multiple |
| Implementation | Inherits implementation | Must provide own |
| super keyword | Available | Not available |
| Method Override | Optional | Mandatory |
| Constructor | Inherited | Must define own |

## Combining extends and implements
Dart allows you to combine both `extends` and `implements`:

```dart
class Bird extends Animal implements Flyer {
  Bird(String name) : super(name);
  
  @override
  void fly() {
    print('$name is flying');
  }
  
  @override
  void land() {
    print('$name is landing');
  }
}
```

## Best Practices

1. Use `extends` when:
   - You want to create a specialization of a class
   - You need to reuse code from a parent class
   - You want to maintain an "is-a" relationship

2. Use `implements` when:
   - You want to ensure a class follows a specific contract
   - You need to implement multiple interfaces
   - You want to define a common behavior across unrelated classes

3. Use both when:
   - You need to inherit from a base class AND guarantee implementation of specific interfaces
   - You want to combine behavior from multiple sources while maintaining an "is-a" relationship with a parent class

## Code Examples

### Complete Implementation Example
```dart
// Base class
abstract class Vehicle {
  String model;
  Vehicle(this.model);
  
  void start();
  void stop();
}

// Interfaces
abstract class Electric {
  void charge();
}

abstract class Autonomous {
  void selfDrive();
}

// Class using both extends and implements
class Tesla extends Vehicle implements Electric, Autonomous {
  Tesla(String model) : super(model);
  
  @override
  void start() {
    print('$model starting silently');
  }
  
  @override
  void stop() {
    print('$model stopping');
  }
  
  @override
  void charge() {
    print('$model charging at Tesla Supercharger');
  }
  
  @override
  void selfDrive() {
    print('$model engaging Autopilot');
  }
}

void main() {
  var tesla = Tesla('Model S');
  tesla.start();      // Model S starting silently
  tesla.selfDrive();  // Model S engaging Autopilot
  tesla.charge();     // Model S charging at Tesla Supercharger
  tesla.stop();       // Model S stopping
}
```

## Final Notes
- Remember that Dart uses implicit interfaces - every class automatically defines an interface containing all its members
- When implementing interfaces, you must provide implementations for all methods
- When extending a class, you can choose which methods to override
- You can implement multiple interfaces but extend only one class