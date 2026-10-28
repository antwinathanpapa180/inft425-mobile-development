import 'dart:math';

// Abstract base class / interface
abstract class Shape {
  String get name;
  double calculateArea();
}

// Circle
class Circle extends Shape {
  final double radius;

  Circle(this.radius) {
    if (radius <= 0) throw ArgumentError('Radius must be greater than 0.');
  }

  @override
  String get name => 'Circle';

  @override
  double calculateArea() => pi * pow(radius, 2);
}

// Rectangle
class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height) {
    if (width <= 0 || height <= 0) {
      throw ArgumentError('Width and height must be greater than 0.');
    }
  }

  @override
  String get name => 'Rectangle';

  @override
  double calculateArea() => width * height;
}

// Triangle
class Triangle extends Shape {
  final double base;
  final double height;

  Triangle(this.base, this.height) {
    if (base <= 0 || height <= 0) {
      throw ArgumentError('Base and height must be greater than 0.');
    }
  }

  @override
  String get name => 'Triangle';

  @override
  double calculateArea() => 0.5 * base * height;
}

// Custom Subclass 1: Square (specialized Rectangle)
class Square extends Shape {
  final double side;

  Square(this.side) {
    if (side <= 0) throw ArgumentError('Side length must be greater than 0.');
  }

  @override
  String get name => 'Square';

  @override
  double calculateArea() => side * side;
}

// Custom Subclass 2: Cube (Calculates total surface area)
class Cube extends Shape {
  final double side;

  Cube(this.side) {
    if (side <= 0) throw ArgumentError('Cube side must be greater than 0.');
  }

  @override
  String get name => 'Cube';

  @override
  double calculateArea() => 6 * (side * side); // Total surface area
}
