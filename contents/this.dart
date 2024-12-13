/*
 ! `this` vs. `super` in Dart
 *
 * `this`:
 * - Refers to the current instance of the class.
 * - Used to access the current class's properties and methods.
 * - Often used to distinguish between instance variables and parameters with the same name.
 *
 * `super`:
 * - Refers to the superclass (parent class) of the current class.
 * - Used to access the properties and methods of the superclass.
 * - Often used in constructor chaining to call the constructor of the superclass.
 * 
 * 
 ! Anonymous Object in Dart
 *
 * - An anonymous object is an object that is created without assigning it to a variable.
 * - It is useful when you need an object for a single use or for immediate execution.
 * 
 *  Person(name: 'Charlie', age: 25).display(); // Output: Name: Charlie, Age: 25
 
 ?-------------------------------------------------------------------------------------------------

 ! Encapsulation in Dart
 *
 * - Encapsulation is the practice of hiding the internal state and requiring all interaction to be performed through an object's methods.
 * - It helps to protect the integrity of the data and provides a controlled interface for interacting with the object.
 */

//! Encapsulation Example 1
class Car {
  String _brand; // Private property

  // Constructor to initialize the brand
  Car(this._brand);

  // Method to set the brand
  void setBrand(String brand) {
    _brand = brand;
  }

  String get b => _brand;

  // Method to get the brand
  String getBrand() {
    return _brand;
  }

  // Method to display car details
  void display() {
    print('Car brand: $_brand');
  }
}

void main(List<String> args) {
  // Handling different brands through methods
  Car car3 = Car('Mercedes');
  print(
      'Original Brand: ${car3.getBrand()}'); // Output: Original Brand: Mercedes
  car3.setBrand('Audi');
  print('Updated Brand: ${car3.getBrand()}'); // Output: Updated Brand: Audi
}

class Rectangle {
  double _width; // Private variable to store width
  double _height; // Private variable to store height

  // Constructor to initialize width and height
  Rectangle(this._width, this._height);

//?--------------------------------------------------------------------------------------------------------------------

  //! Getter for width
  // A getter is a method that retrieves the value of a private variable.
  // It allows controlled access to the variable's value from outside the class.
  double get width => _width;

//?--------------------------------------------------------------------------------------------------------------------

  //! Setter for width
  // A setter is a method that allows you to set the value of a private variable.
  // It includes validation logic to ensure the value being assigned is valid.
  set width(double value) {
    if (value > 0) {
      _width = value;
    } else {
      print('Width must be positive.');
    }
  }

//?--------------------------------------------------------------------------------------------------------------------

  //! Getter for height
  double get height => _height;

//?--------------------------------------------------------------------------------------------------------------------

  //! Setter for height
  set height(double value) {
    if (value > 0) {
      _height = value;
    } else {
      print('Height must be positive.');
    }
  }

//?--------------------------------------------------------------------------------------------------------------------

  //! Getter for area (read-only property)
  // This getter calculates and returns the area of the rectangle.
  double get area => _width * _height;
}
