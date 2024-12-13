# Arrow Functions in Dart

## Basic Syntax
Arrow functions provide a shorthand syntax for functions that contain a single expression:

```dart
// Regular function
void regularFunction() {
  print('Hello');
}

// Arrow function equivalent
void arrowFunction() => print('Hello');

// With parameters and return value
int add(int a, int b) => a + b;
```

## Key Characteristics

1. **Single Expression Only**
```dart
// Valid arrow function
var multiply = (int a, int b) => a * b;

// Invalid arrow function (multiple expressions)
// var invalid = () => {
//   print('Hello');
//   return 42;
// };
```

2. **Implicit Return**
```dart
// These are equivalent:
String getName() => 'John';

String getName() {
  return 'John';
}
```

## Common Use Cases

1. **Collection Methods**
```dart
final numbers = [1, 2, 3, 4, 5];

// map
var doubled = numbers.map((n) => n * 2);

// where
var evenNumbers = numbers.where((n) => n % 2 == 0);

// forEach
numbers.forEach((n) => print(n));

// sort
numbers.sort((a, b) => a.compareTo(b));
```

2. **Widget Building (Flutter)**
```dart
// Simple widget builder
Widget buildText() => Text('Hello World');

// Widget with parameter
Widget buildCustomText(String text) => Text(text);

// Conditional widget
Widget buildConditional(bool condition) => 
    condition ? Text('True') : Text('False');
```

3. **Event Handlers**
```dart
// Button click handler
ElevatedButton(
  onPressed: () => handleClick(),
  child: Text('Click Me')
);

// Gesture detector
GestureDetector(
  onTap: () => print('Tapped!'),
  child: Container()
);
```

4. **Future Operations**
```dart
// Simple Future
Future<String> getData() => Future.value('Data');

// Async shorthand
Future<void> loadData() async => await api.fetchData();

// Future.then handler
getData().then((value) => print(value));
```

5. **Getters and Setters**
```dart
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  // Getter using arrow syntax
  double get area => width * height;
  double get perimeter => 2 * (width + height);
}
```

## Best Practices

1. **Use for Simple Operations**
```dart
// Good - simple and clear
var sum = (int a, int b) => a + b;

// Bad - too complex for arrow syntax
var complex = (int x) => x > 0 ? 
    x < 10 ? 'small' : 'large' : 'negative';
```

2. **Type Annotations When Helpful**
```dart
// With type annotations
List<int> getNumbers() => [1, 2, 3];

// Parameter types
int calculate(int x, int y) => x + y;
```

3. **Chaining Operations**
```dart
final result = numbers
    .where((n) => n % 2 == 0)
    .map((n) => n * 2)
    .toList();
```

## Limitations and When Not to Use

1. **Multiple Statements**
```dart
// Need regular function for multiple statements
void processData() {
  validateData();
  transformData();
  saveData();
}
```

2. **Complex Logic**
```dart
// Better as regular function
int complexCalculation(int value) {
  if (value < 0) {
    return -value;
  }
  if (value > 100) {
    return 100;
  }
  return value * 2;
}
```

3. **Exception Handling**
```dart
// Need regular function for try-catch
Future<void> fetchData() async {
  try {
    final data = await api.getData();
    processData(data);
  } catch (e) {
    handleError(e);
  }
}
```

## Tips and Tricks

1. **Combining with Null Safety**
```dart
String? getNullableName() => someCondition ? 'John' : null;

// Null-aware operator
String getDefaultName() => getNullableName() ?? 'Default';
```

2. **Method References**
```dart
// Instead of
numbers.forEach((n) => print(n));

// You can use
numbers.forEach(print);
```

3. **Cascading Operations**
```dart
final result = items
    .where((item) => item.isValid)
    .map((item) => item.process())
    .where((result) => result != null)
    .toList();
```