import 'package:test/test.dart';

// Class with our collection logic to test
class CollectionUtils {
  static List<int> getEvenNumbers(List<int> numbers) {
    return numbers.where((n) => n % 2 == 0).toList();
  }

  static int calculateSum(List<int> numbers) {
    if (numbers.isEmpty) return 0;
    return numbers.reduce((a, b) => a + b);
  }
}

void main() {
  group('CollectionUtils Tests', () {
    test('getEvenNumbers should return only even numbers', () {
      List<int> input = [1, 2, 3, 4, 5, 6];
      List<int> result = CollectionUtils.getEvenNumbers(input);
      
      expect(result, equals([2, 4, 6]));
    });

    test('calculateSum should return the correct total sum', () {
      List<int> input = [10, 20, 30];
      int result = CollectionUtils.calculateSum(input);
      
      expect(result, equals(60));
    });

    test('calculateSum should return 0 for an empty list', () {
      List<int> input = [];
      int result = CollectionUtils.calculateSum(input);
      
      expect(result, equals(0));
    });
  });
}
