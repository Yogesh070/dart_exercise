# Error Handling in Dart

## 1. Try-Catch Blocks

### Basic Try-Catch
```dart
void main() {
  try {
    int result = 12 ~/ 0; // Integer division by zero
    print(result);
  } catch (e) {
    print('Error caught: $e');
  }
}
```

### Multiple Catch Blocks
```dart
void main() {
  try {
    // Some code that might throw different types of errors
    throwRandomError();
  } on FormatException catch (e) {
    print('Format Exception: $e');
  } on IOException catch (e) {
    print('IO Exception: $e');
  } catch (e, stackTrace) {
    // Catches any other type of error
    print('Unknown error: $e');
    print('Stack trace: $stackTrace');
  }
}
```

### Finally Block
```dart
void processFile() {
  var file;
  try {
    file = File('example.txt');
    var contents = file.readAsStringSync();
    print(contents);
  } catch (e) {
    print('Error reading file: $e');
  } finally {
    // This code always executes
    if (file != null) {
      file.close();
    }
  }
}
```

## 2. Custom Exceptions

### Creating Custom Exceptions
```dart
class CustomException implements Exception {
  final String message;
  final int errorCode;

  CustomException(this.message, this.errorCode);

  @override
  String toString() => 'CustomException: $message (Error Code: $errorCode)';
}

class ValidationException implements Exception {
  final String field;
  final String message;

  ValidationException(this.field, this.message);

  @override
  String toString() => 'ValidationException: $field - $message';
}
```

### Using Custom Exceptions
```dart
void validateUser(String username, String password) {
  if (username.isEmpty) {
    throw ValidationException('username', 'Username cannot be empty');
  }
  
  if (password.length < 6) {
    throw ValidationException('password', 'Password must be at least 6 characters');
  }
}

void main() {
  try {
    validateUser('', 'pass');
  } on ValidationException catch (e) {
    print('Validation failed: ${e.field} - ${e.message}');
  }
}
```

## 3. Async Error Handling

### Future Error Handling
```dart
Future<void> fetchData() async {
  try {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Network error');
  } catch (e) {
    print('Error: $e');
    rethrow; // Rethrows the caught exception
  }
}

// Using then() and catchError()
void handleFuture() {
  fetchData()
    .then((value) => print('Success'))
    .catchError((error) => print('Caught error: $error'))
    .whenComplete(() => print('Complete'));
}

// Using async-await
Future<void> handleFutureAsync() async {
  try {
    await fetchData();
    print('Success');
  } catch (e) {
    print('Caught error: $e');
  } finally {
    print('Complete');
  }
}
```

### Stream Error Handling
```dart
Stream<int> countStream() async* {
  for (int i = 0; i < 5; i++) {
    if (i == 3) throw Exception('Error at count 3');
    yield i;
  }
}

void handleStream() {
  countStream().listen(
    (data) => print('Data: $data'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream complete'),
    cancelOnError: false // Set to true to stop listening on error
  );
}
```

## 4. Zone Error Handling

### Using Zones for Error Handling
```dart
import 'dart:async';

void main() {
  runZonedGuarded(
    () {
      // Your application code here
      throw Exception('Unexpected error');
    },
    (error, stack) {
      print('Caught error in zone: $error');
      print('Stack trace: $stack');
      // Log error to analytics, crash reporting, etc.
    }
  );
}
```

## 5. Best Practices

### 1. Specific to General Exception Handling
```dart
Future<void> processData() async {
  try {
    await fetchData();
  } on HttpException catch (e) {
    // Handle specific HTTP errors
    print('HTTP Error: $e');
  } on SocketException catch (e) {
    // Handle network errors
    print('Network Error: $e');
  } catch (e) {
    // Handle all other errors
    print('Unknown Error: $e');
  }
}
```

### 2. Error Recovery
```dart
Future<String> fetchDataWithRetry() async {
  int attempts = 3;
  
  while (attempts > 0) {
    try {
      return await fetchData();
    } catch (e) {
      attempts--;
      if (attempts == 0) rethrow;
      await Future.delayed(Duration(seconds: 1));
    }
  }
  
  throw Exception('All retry attempts failed');
}
```

### 3. Resource Cleanup
```dart
class ResourceManager {
  void useResource() {
    var resource;
    try {
      resource = Resource();
      // Use resource
    } finally {
      resource?.dispose();
    }
  }
}
```

### 4. Logging and Debugging
```dart
void logError(dynamic error, StackTrace stackTrace) {
  // Log to console in development
  if (kDebugMode) {
    print('Error: $error');
    print('Stack trace: $stackTrace');
  }
  
  // Log to analytics in production
  analytics.logError(error, stackTrace);
}

Future<void> performOperation() async {
  try {
    // Risky operation
  } catch (e, stackTrace) {
    logError(e, stackTrace);
    rethrow;
  }
}
```