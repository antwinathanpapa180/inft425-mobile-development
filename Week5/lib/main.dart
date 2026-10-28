class CollectionUtils {
  // Filters even numbers from a list
  static List<int> getEvenNumbers(List<int> numbers) {
    return numbers.where((n) => n % 2 == 0).toList();
  }

  // Calculates the sum of a list
  static int calculateSum(List<int> numbers) {
    if (numbers.isEmpty) return 0;
    return numbers.reduce((a, b) => a + b);
  }
}
