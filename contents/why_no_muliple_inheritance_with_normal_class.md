Multiple inheritance with normal classes (extending multiple classes) is not supported in Dart for several important reasons:

1. **The Diamond Problem**
Here's an example of what could go wrong:
```dart
class A {
  void doSomething() {
    print('A doing something');
  }
}

class B extends A {
  @override
  void doSomething() {
    print('B doing something');
  }
}

class C extends A {
  @override
  void doSomething() {
    print('C doing something');
  }
}

// If this was possible (it's not):
// class D extends B, C { }  // Which doSomething() would D inherit?
```

The problem is:
- Class D extends both B and C
- Both B and C override doSomething()
- D doesn't know which version of doSomething() to use
- It creates ambiguity in method resolution

2. **State Inheritance Complexity**
```dart
class Engine {
  int power = 100;
}

class Battery {
  int power = 50;
}

// If this was possible:
// class ElectricCar extends Engine, Battery {
//   void showPower() {
//     print(power); // Which power? Engine's or Battery's?
//   }
// }
```

3. **Constructor Chain Complications**
```dart
class A {
  A(int x) {
    print('Initializing A with $x');
  }
}

class B {
  B(String y) {
    print('Initializing B with $y');
  }
}

// If this was possible:
// class C extends A, B {
//   // How would you call both parent constructors?
//   // super.A(10) and super.B("hello")? Which one first?
//   C() : ?????
// }
```

Instead, Dart provides better alternatives:

1. **Using Interfaces (implements)**
```dart
class A {
  void methodA() => print('Method A');
}

class B {
  void methodB() => print('Method B');
}

// Clear and unambiguous
class C implements A, B {
  @override
  void methodA() => print('C\'s implementation of A');
  
  @override
  void methodB() => print('C\'s implementation of B');
}
```

2. **Using Mixins (with)**
```dart
mixin Walking {
  void walk() => print('Walking');
}

mixin Swimming {
  void swim() => print('Swimming');
}

class Duck with Walking, Swimming {
  // Gets both walk() and swim() methods
}
```

3. **Using Composition**
```dart
class Engine {
  void start() => print('Engine starting');
}

class Radio {
  void play() => print('Radio playing');
}

class Car {
  final engine = Engine();
  final radio = Radio();
  
  void start() {
    engine.start();
    radio.play();
  }
}
```

The benefits of Dart's approach:
1. Clearer code organization
2. No ambiguity in method resolution
3. More predictable behavior
4. Easier to maintain and debug
5. Better performance (simpler method lookup)

So while multiple inheritance might seem useful, its problems usually outweigh its benefits. Dart's combination of single inheritance, interfaces, and mixins provides all the flexibility needed while avoiding the complexities and ambiguities of multiple inheritance.