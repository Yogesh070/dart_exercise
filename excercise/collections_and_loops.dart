// Advanced Exercises for Lists, Loops, and Maps

// List Exercises

// 1. List Transformation
List<int> doubleElements(List<int> numbers) {
  // TODO: Return a new list with each number doubled
  // Example: [1, 2, 3] -> [2, 4, 6]
  return [];
}

// 2. List Filtering
List<String> filterLongStrings(List<String> strings, int minLength) {
  // TODO: Return a new list containing only strings longer than minLength
  // Example: (["hi", "hello", "hey", "howdy"], 3) -> ["hello", "howdy"]
  return [];
}

// 3. List Manipulation
List<int> insertInSortedPosition(List<int> sortedList, int newNumber) {
  // TODO: Insert newNumber into the already sorted list while maintaining the order
  // Example: ([1, 3, 5, 7], 4) -> [1, 3, 4, 5, 7]
  return [];
}

// 4. 2D List Processing
List<List<int>> generateMultiplicationTable(int size) {
  // TODO: Generate a multiplication table of size x size
  // Example: size=3 -> [[1,2,3], [2,4,6], [3,6,9]]
  return [];
}

// Loop Exercises

// 5. Pattern Printing
String generatePattern(int rows) {
  // TODO: Generate a triangle pattern
  // Example: rows=3 ->
  // *
  // **
  // ***
  return '';
}

// 6. Number Series
List<int> fibonacciSequence(int count) {
  // TODO: Generate Fibonacci sequence with 'count' numbers
  // Example: count=5 -> [1, 1, 2, 3, 5]
  return [];
}

// 7. Nested Loops
List<String> findCommonElements(List<List<String>> arrays) {
  // TODO: Find elements that appear in all arrays
  // Example: [["a", "b"], ["b", "c"], ["b", "d"]] -> ["b"]
  return [];
}

// Map Exercises

// 8. Map Manipulation
Map<String, int> mergeMaps(Map<String, int> map1, Map<String, int> map2) {
  // TODO: Merge two maps, adding values for common keys
  // Example: {"a": 1, "b": 2} and {"b": 3, "c": 4} -> {"a": 1, "b": 5, "c": 4}
  return {};
}

// 9. Map Transformation
Map<String, String> invertMap(Map<String, String> original) {
  // TODO: Create a new map with keys and values swapped
  // Example: {"a": "1", "b": "2"} -> {"1": "a", "2": "b"}
  return {};
}

// 10. Advanced Map Processing
Map<String, int> wordFrequencyCounter(String text) {
  // TODO: Count frequency of each word in the text
  // Example: "hello world hello" -> {"hello": 2, "world": 1}
  return {};
}

// 11. Combined List and Map
List<Map<String, dynamic>> groupByAge(List<Map<String, dynamic>> people) {
  // TODO: Group people by age ranges (0-18, 19-35, 36-50, 51+)
  // Example: [{"name": "John", "age": 25}, {"name": "Jane", "age": 17}] ->
  // [{"range": "0-18", "people": ["Jane"]}, {"range": "19-35", "people": ["John"]}]
  return [];
}

// 12. Map Filtering
Map<String, dynamic> filterMapByValue(
    Map<String, dynamic> input, bool Function(dynamic) condition) {
  // TODO: Return a new map containing only key-value pairs where value meets the condition
  // Example: ({"a": 1, "b": 2, "c": 3}, (value) => value > 2) -> {"c": 3}
  return {};
}

void main() {
  // Test List Exercises
  print('\nTest doubleElements:');
  print(doubleElements([1, 2, 3, 4, 5]));

  print('\nTest filterLongStrings:');
  print(filterLongStrings(['apple', 'banana', 'kiwi', 'pear'], 4));

  print('\nTest insertInSortedPosition:');
  print(insertInSortedPosition([1, 3, 5, 7], 4));

  print('\nTest generateMultiplicationTable:');
  print(generateMultiplicationTable(3));

  // Test Loop Exercises
  print('\nTest generatePattern:');
  print(generatePattern(4));

  print('\nTest fibonacciSequence:');
  print(fibonacciSequence(7));

  print('\nTest findCommonElements:');
  print(findCommonElements([
    ['a', 'b', 'c'],
    ['b', 'c', 'd'],
    ['b', 'e', 'f']
  ]));

  // Test Map Exercises
  print('\nTest mergeMaps:');
  print(mergeMaps({'a': 1, 'b': 2}, {'b': 3, 'c': 4}));

  print('\nTest invertMap:');
  print(invertMap({'a': '1', 'b': '2', 'c': '3'}));

  print('\nTest wordFrequencyCounter:');
  print(wordFrequencyCounter('hello world hello dart world'));

  print('\nTest groupByAge:');
  print(groupByAge([
    {'name': 'John', 'age': 25},
    {'name': 'Jane', 'age': 17},
    {'name': 'Bob', 'age': 40}
  ]));

  print('\nTest filterMapByValue:');
  print(filterMapByValue(
      {'a': 1, 'b': 2, 'c': 3, 'd': 4}, (value) => value % 2 == 0));
}
