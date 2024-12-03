// Exercise 1: Variables and Data Types
// Complete the following functions according to the comments

// 1. Create variables of different types
void variableExercise() {
  // TODO: Create an integer variable named 'age' with value 25

  // TODO: Create a double variable named 'height' with value 5.9

  // TODO: Create a String variable named 'name' with your name

  // TODO: Create a boolean variable named 'isStudent' with true or false

  // Print all variables
}

// 2. Basic Operations
double calculateBMI(double weight, double height) {
  // TODO: Calculate BMI using the formula: weight / (height * height)
  // weight in kg, height in meters
  return 0.0; // Replace with actual calculation
}

// 3. String Operations
String formatFullName(String firstName, String lastName) {
  // TODO: Return the full name in the format: "LastName, FirstName"
  return ''; // Replace with actual format
}

// 4. Control Flow
String gradeCalculator(int score) {
  // TODO: Return grade based on score:
  // 90-100: 'A'
  // 80-89: 'B'
  // 70-79: 'C'
  // 60-69: 'D'
  // Below 60: 'F'
  return ''; // Replace with actual grade
}

// 5. Lists and Loops
List<int> generateEvenNumbers(int start, int end) {
  // TODO: Return a list of even numbers between start and end (inclusive)
  return []; // Replace with actual list
}

// 6. Maps
Map<String, int> countCharacters(String input) {
  // TODO: Return a map containing each character and its frequency in the string
  return {}; // Replace with actual map
}

// 7. Null Safety
String? findLongestWord(List<String>? words) {
  // TODO: Return the longest word in the list
  // If list is null or empty, return null
  return null; // Replace with actual implementation
}

// Main function to test your solutions
void main() {
  // Test Exercise 1
  print('\nExercise 1: Variables');
  variableExercise();

  // Test Exercise 2
  print('\nExercise 2: BMI Calculator');
  print(calculateBMI(70, 1.75)); // Should print around 22.86

  // Test Exercise 3
  print('\nExercise 3: Name Formatter');
  print(formatFullName('John', 'Doe')); // Should print "Doe, John"

  // Test Exercise 4
  print('\nExercise 4: Grade Calculator');
  print(gradeCalculator(85)); // Should print "B"

  // Test Exercise 5
  print('\nExercise 5: Even Numbers');
  print(generateEvenNumbers(1, 10)); // Should print [2, 4, 6, 8, 10]

  // Test Exercise 6
  print('\nExercise 6: Character Counter');
  print(countCharacters('hello')); // Should print {h: 1, e: 1, l: 2, o: 1}

  // Test Exercise 7
  print('\nExercise 7: Longest Word');
  print(findLongestWord(
      ['dart', 'javascript', 'python'])); // Should print "javascript"
}
