//  ! Inheritance allows a class to inherit properties and methods from another class.
//   The class that inherits is called the subclass (or child class), and
//   the class being inherited from is called the superclass (or parent class).

// ignore_for_file: avoid_print

void main() {
  //! Creating an instance of Dog
  // const Dog dog = Dog('Buddy', 3, 'Golden Retriever');
  // dog.display(); // Output: Name: Buddy, Age: 3
  // dog.makeSound(); // Output: Buddy barks.
  // dog.displayBreed(); // Output: Buddy is a Golden Retriever.

  // //! Creating an instance of Cat
  // const Cat cat = Cat('Whiskers', 2, 'black');
  // cat.display(); // Output: Name: Whiskers, Age: 2
  // cat.makeSound(); // Output: Whiskers meows.
  // cat.displayColor(); // Output: Whiskers is black in color.

  Animal unknown = Cat('Whiskers', 2, 'black');
  unknown = Dog('Buddy', 3, 'Golden Retriever');
  unknown.display();
}

//! Superclass (Base Class or Parent Class)
abstract class Animal {
  final String name;
  final int age;

  // Constructor to initialize properties
  const Animal(this.name, this.age);

  // Method to display animal details
  void display() {
    print('Name: $name, Age: $age');
  }

  // Method to make a sound
  void makeSound() {
    print('$name makes a sound.');
  }
}

//?--------------------------------------------------------------------------------------------------------------------

//! Subclass (Derived Class or Child Class) extending Animal
class Dog extends Animal {
  // Additional property specific to Dog
  final String breed;

  // Constructor to initialize properties of both Dog and Animal
  // Dog(String name, int age, this.breed) : super(name, age);
  const Dog(super.name, super.age, this.breed);

  // Overriding the makeSound method
  @override
  void makeSound() {
    print('$name barks.');
  }

  // Additional method specific to Dog
  void displayBreed() {
    print('$name is a $breed.');
  }
}

//?--------------------------------------------------------------------------------------------------------------------

//! Another Subclass (Derived Class or Child Class) extending Animal
class Cat extends Animal {
  // Additional property specific to Cat
  final String color;

  // Constructor to initialize properties of both Cat and Animal
  // Cat(String name, int age, this.color) : super(name, age);
  const Cat(super.name, super.age, this.color);

  // Overriding the makeSound method
  @override
  void makeSound() {
    print('$name meows.');
  }

  // Additional method specific to Cat
  void displayColor() {
    print('$name is $color in color.');
  }
}


// Abstract classes can't be instantiated because they are meant to serve as blueprints or templates for other classes, rather than being complete classes themselves. Here's why:

// Incomplete implementation - Abstract classes often contain abstract methods that don't have a body/implementation. Since these methods aren't implemented, creating an instance wouldn't make sense as you couldn't actually use those methods.
// Design purpose - They are specifically designed to be inherited from, not used directly. Abstract classes define a common interface and shared functionality that child classes should implement.