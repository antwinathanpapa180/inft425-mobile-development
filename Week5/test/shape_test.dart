import 'dart:math';
import 'package:test/test.dart';
import '../lib/shape.dart';

void main() {
  group('Shape Interface & Area Calculation Tests', () {
    test('Circle area computes correctly', () {
      var circle = Circle(5.0);
      expect(circle.name, equals('Circle'));
      expect(circle.calculateArea(), closeTo(pi * 25, 0.001));
    });

    test('Rectangle & Triangle areas compute correctly', () {
      var rect = Rectangle(4.0, 6.0);
      expect(rect.calculateArea(), equals(24.0));

      var tri = Triangle(10.0, 5.0);
      expect(tri.calculateArea(), equals(25.0));
    });

    test('Square and Cube calculate areas correctly', () {
      var square = Square(4.0);
      expect(square.calculateArea(), equals(16.0));

      var cube = Cube(3.0);
      expect(cube.name, equals('Cube'));
      expect(cube.calculateArea(), equals(54.0)); // 6 * (3^2) = 54
    });

    test('Shapes throw ArgumentError on invalid non-positive dimensions', () {
      expect(() => Circle(-2), throwsArgumentError);
      expect(() => Rectangle(0, 5), throwsArgumentError);
      expect(() => Triangle(4, -1), throwsArgumentError);
      expect(() => Square(0), throwsArgumentError);
      expect(() => Cube(-5), throwsArgumentError);
    });
  });
}
