# Asynchronous Programming in Dart

## 1. Future

A Future represents a value that will be available at some point in the future.

### Basic Future Usage
```dart
Future<String> fetchUserData() {
  return Future.delayed(
    Duration(seconds: 2),
    () => 'User Data',
  );
}

// Using .then()
void main() {
  print('Fetching user data...');
  fetchUserData().then(
    (data) => print(data),
    onError: (error) => print('Error: $error'),
  );
  print('This prints first!');
}
```

### Future States
```dart
Future<String> getFuture() {
  return Future<String>.delayed(
    Duration(seconds: 1),
    () {
      if (DateTime.now().isAfter(DateTime(2024))) {
        throw Exception('Future failed');
      }
      return 'Future completed';
    },
  );
}

// Future can be in one of three states:
// 1. Uncompleted
// 2. Completed with data
// 3. Completed with error
```

## 2. Async/Await

Async/await provides a cleaner way to work with Futures.

### Basic Usage
```dart
Future<void> printUserData() async {
  try {
    print('Fetching data...');
    String data = await fetchUserData();
    print('Data: $data');
  } catch (e) {
    print('Error: $e');
  }
}

// Function marked with async returns a Future
Future<int> calculateValue() async {
  await Future.delayed(Duration(seconds: 1));
  return 42;
}
```

### Error Handling
```dart
Future<void> handleErrors() async {
  try {
    await Future.error('Something went wrong');
  } catch (e) {
    print('Caught error: $e');
  } finally {
    print('Cleanup code here');
  }
}
```

## 3. Multiple Futures

### Future.wait
Execute multiple Futures in parallel:
```dart
Future<void> handleMultipleFutures() async {
  try {
    List<String> results = await Future.wait([
      fetchUserData(),
      fetchUserProfile(),
      fetchUserSettings(),
    ]);
    
    print('All data fetched:');
    results.forEach(print);
  } catch (e) {
    print('One of the futures failed: $e');
  }
}
```

### Future.forEach
Process items sequentially:
```dart
Future<void> processItems(List<String> items) async {
  await Future.forEach(items, (String item) async {
    await processItem(item);
    print('Processed $item');
  });
}
```

### Future.any
Complete when any Future completes:
```dart
Future<String> getFastestResponse() async {
  return Future.any([
    fetchFromServer1(),
    fetchFromServer2(),
    fetchFromServer3(),
  ]);
}
```

## 4. Streams

Streams provide a sequence of asynchronous events.

### Basic Stream Usage
```dart
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// Using a Stream
void main() async {
  Stream<int> stream = countStream(5);
  
  // Listen to the stream
  await for (int number in stream) {
    print(number);
  }
}
```

### StreamController
```dart
class DataService {
  final _controller = StreamController<String>();
  
  Stream<String> get dataStream => _controller.stream;
  
  void addData(String data) {
    _controller.sink.add(data);
  }
  
  void addError(String error) {
    _controller.sink.addError(error);
  }
  
  void dispose() {
    _controller.close();
  }
}
```

### Stream Transformations
```dart
void streamTransformations() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);
  
  // Using map
  Stream<int> doubled = numbers.map((number) => number * 2);
  
  // Using where
  Stream<int> evenNumbers = numbers.where((number) => number % 2 == 0);
  
  // Using asyncMap
  Stream<String> processed = numbers.asyncMap((number) async {
    await Future.delayed(Duration(seconds: 1));
    return 'Number: $number';
  });
}
```

### Broadcast Streams
```dart
void broadcastStreamExample() async {
  // Create a broadcast stream
  StreamController<int> controller = StreamController.broadcast();
  
  // First listener
  controller.stream.listen(
    (data) => print('Listener 1: $data'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Done'),
  );
  
  // Second listener
  controller.stream.listen(
    (data) => print('Listener 2: $data'),
  );
  
  // Add data to stream
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  
  // Close the controller when done
  await controller.close();
}
```

## 5. Practical Examples

### API Calls
```dart
class UserService {
  Future<User> fetchUser(String id) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.example.com/users/$id')
      );
      
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
```

### Real-time Updates
```dart
class MessageService {
  final _messages = StreamController<Message>.broadcast();
  
  Stream<Message> get messageStream => _messages.stream;
  
  void sendMessage(Message message) {
    _messages.sink.add(message);
  }
  
  Future<void> connect() async {
    try {
      WebSocket socket = await WebSocket.connect('ws://example.com');
      socket.listen(
        (data) => _messages.sink.add(Message.fromJson(data)),
        onError: (error) => _messages.sink.addError(error),
      );
    } catch (e) {
      _messages.sink.addError(e);
    }
  }
}
```

### Periodic Updates
```dart
Stream<DateTime> timeStream() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield DateTime.now();
  }
}

void showClock() async {
  await for (var time in timeStream()) {
    print('Current time: ${time.hour}:${time.minute}:${time.second}');
  }
}
```