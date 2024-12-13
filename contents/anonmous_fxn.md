# Anonymous Functions in Dart

## Basic Syntax

1. **Standard Form**
```dart
var function = (parameters) {
  // function body
  return value;
};
```

2. **Arrow Syntax** (for single expressions)
```dart
var function = (parameters) => expression;

var sum = (int a,int b) =>a+b;

void sum(int a,int b){
  return a+b;
}
```

## Common Use Cases

1. **As Function Parameters**
```dart
void main() {
  // List of numbers
  var numbers = [1, 2, 3, 4, 5];

  // Using anonymous function with forEach
  numbers.forEach((number) {
    print(number * 2);
  });

  // Same with arrow syntax
  numbers.forEach((number) => print(number * 2));

  // Using where with anonymous function
  var evenNumbers = numbers.where((number) => number % 2 == 0);

  // Using map with anonymous function
  var doubled = numbers.map((number) => number * 2);
}
```

2. **Assigned to Variables**
```dart
void main() {
  // Function type notation
  Function(int, int) add = (int a, int b) => a + b;
  
  // Type inference
  var multiply = (int a, int b) => a * b;
  
  // Using the functions
  print(add(5, 3));      // Output: 8
  print(multiply(4, 2)); // Output: 8
}
```

3. **As Callback Functions**
```dart
void performOperation(int a, int b, Function(int, int) operation) {
  print('Result: ${operation(a, b)}');
}

void main() {
  // Passing anonymous functions as callbacks
  performOperation(5, 3, (a, b) => a + b);  // Addition
  performOperation(5, 3, (a, b) => a - b);  // Subtraction
  performOperation(5, 3, (a, b) => a * b);  // Multiplication
}
```

4. **With Future and async**
```dart
void main() {
  // With Future
  Future.delayed(
    Duration(seconds: 2),
    () => print('Delayed message')  // Anonymous function
  );

  // With async
  Future(() async {
    await Future.delayed(Duration(seconds: 1));
    print('Async operation complete');
  });
}
```

5. **Event Handlers**
```dart
// Example with Flutter button
ElevatedButton(
  onPressed: () {
    print('Button pressed!');
    // Handle button press
  },
  child: Text('Press Me'),
)
```

## Advanced Usage

1. **Closure (Accessing Outer Scope)**
```dart
Function makeMultiplier(int multiplier) {
  // Returns an anonymous function that has access to multiplier
  return (int value) => value * multiplier;
}

void main() {
  var times2 = makeMultiplier(2);
  var times3 = makeMultiplier(3);
  
  print(times2(5));  // Output: 10
  print(times3(5));  // Output: 15
}
```

2. **Multiple Parameters**
```dart
void main() {
  // Multiple parameters
  var operation = (int a, int b, String op) {
    switch(op) {
      case '+': return a + b;
      case '-': return a - b;
      case '*': return a * b;
      default: return 0;
    }
  };

  print(operation(5, 3, '+'));  // Output: 8
  print(operation(5, 3, '*'));  // Output: 15
}
```

3. **Optional Parameters**
```dart
void main() {
  // With optional parameters
  var greet = (String name, {String title = 'Mr.'}) {
    return 'Hello $title $name';
  };

  print(greet('John'));             // Output: Hello Mr. John
  print(greet('Jane', title: 'Ms.')); // Output: Hello Ms. Jane
}
```

## Best Practices

1. **Use Arrow Syntax for Simple Functions**
```dart
// Good
numbers.map((n) => n * 2);

// Less readable for complex operations
numbers.map((n) => {
  if (n % 2 == 0) return n * 2;
  else return n;
});
```

2. **Meaningful Parameter Names**
```dart
// Bad
list.forEach((x) => print(x));

// Good
list.forEach((item) => print(item));
```

3. **Type Annotations When Needed**
```dart
// With type annotation
var sum = (int a, int b) => a + b;

// Type inference is fine when obvious
list.map((item) => item.toString());
```

## Common Pitfalls

1. **Forgetting Parentheses**
```dart
// Error
var func = => print('Hello');

// Correct
var func = () => print('Hello');
```

2. **Complex Logic in Arrow Functions**
```dart
// Bad: Too complex for arrow syntax
var complex = (int x) => x > 0 ? 
  x < 10 ? 'small' : 'large' : 'negative';

// Better: Use block syntax
var better = (int x) {
  if (x > 0) {
    return x < 10 ? 'small' : 'large';
  }
  return 'negative';
};
```