# Loops in Dart

## 1. For Loop

### Standard For Loop
```dart
void main() {
  // Basic for loop
  for (int i = 0; i < 5; i++) {
    print(i); // Prints 0, 1, 2, 3, 4
  }
  
  // Decremental for loop
  for (int i = 5; i > 0; i--) {
    print(i); // Prints 5, 4, 3, 2, 1
  }
  
  // Step increment
  for (int i = 0; i < 10; i += 2) {
    print(i); // Prints 0, 2, 4, 6, 8
  }
}
```

### For-in Loop (Iterate Collections)
```dart
void main() {
  // Iterating over a list
  var fruits = ['apple', 'banana', 'orange'];
  for (var fruit in fruits) {
    print(fruit);
  }
  
  // Iterating over a set
  var numbers = {1, 2, 3, 4, 5};
  for (var number in numbers) {
    print(number);
  }
}
```

## 2. While Loop
```dart
void main() {
  // Basic while loop
  int count = 0;
  while (count < 5) {
    print(count);
    count++;
  }
  
  // While loop with condition
  String? input = '';
  while (input != 'quit') {
    print('Enter "quit" to exit');
    input = stdin.readLineSync();
  }
}
```

## 3. Do-While Loop
```dart
void main() {
  // Basic do-while loop
  int i = 0;
  do {
    print(i);
    i++;
  } while (i < 5);
  
  // Do-while with condition
  String? password;
  do {
    print('Enter password:');
    password = stdin.readLineSync();
  } while (password != 'secret');
}
```

## 4. Foreach Loop
```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // Using forEach with anonymous function
  numbers.forEach((number) {
    print(number);
  });
  
  // Using forEach with arrow function
  numbers.forEach((n) => print(n));
  
  // Using forEach with named function
  numbers.forEach(printNumber);
}

void printNumber(int number) {
  print(number);
}
```

## 5. Loop Control Statements

### Break Statement
```dart
void main() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break; // Exits loop when i equals 5
    }
    print(i);
  }
  
  // Break with labeled loop
  outerloop: for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (i == 1 && j == 1) {
        break outerloop;
      }
      print('$i $j');
    }
  }
}
```

### Continue Statement
```dart
void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue; // Skips iteration when i equals 2
    }
    print(i);
  }
  
  // Continue with labeled loop
  outerloop: for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (i == 1 && j == 1) {
        continue outerloop;
      }
      print('$i $j');
    }
  }
}
```

## 6. Common Use Cases

### Iterating Maps
```dart
void main() {
  var map = {
    'name': 'John',
    'age': 30,
    'city': 'New York'
  };
  
  // Iterating over entries
  for (var entry in map.entries) {
    print('${entry.key}: ${entry.value}');
  }
  
  // Iterating over keys
  for (var key in map.keys) {
    print('$key: ${map[key]}');
  }
  
  // Using forEach
  map.forEach((key, value) => print('$key: $value'));
}
```

### List Manipulation
```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // Modifying list elements
  for (var i = 0; i < numbers.length; i++) {
    numbers[i] *= 2;
  }
  
  // Creating new list with transformed elements
  var doubled = [
    for (var number in numbers) number * 2
  ];
  
  // List comprehension with condition
  var evenNumbers = [
    for (var number in numbers)
      if (number % 2 == 0) number
  ];
}
```

### Nested Loops
```dart
void main() {
  // Multiplication table
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= 5; j++) {
      print('$i * $j = ${i * j}');
    }
    print('---');
  }
}
```