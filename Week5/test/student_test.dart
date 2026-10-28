import 'package:test/test.dart';
import '../lib/student.dart';

void main() {
  group('Student Class, Getters, and Console Methods Tests', () {
    test('Student creation initializes correctly, computes initials, and age in months', () {
      var student = Student(
        name: 'Nathan Papa',
        age: 23,
        program: 'Computer Science',
        gpa: 3.9,
      );
      expect(student.name, equals('Nathan Papa'));
      expect(student.age, equals(23));
      expect(student.program, equals('Computer Science'));
      expect(student.gpa, equals(3.9));
      expect(student.initials, equals('NP'));
      expect(student.ageInMonths, equals(276)); // 23 * 12
    });

    test('Adding courses works and prevents duplicates or blanks', () {
      var student = Student(
        name: 'Nana Yaw',
        age: 22,
        program: 'Information Technology',
        gpa: 3.5,
      );
      student.addCourse('Compiler Design');
      student.addCourse('Mobile App Development');
      
      expect(student.courses.length, equals(2));
      expect(student.courses, contains('Compiler Design'));
      
      expect(() => student.addCourse('   '), throwsArgumentError);
    });

    test('Honors status calculates correctly based on GPA', () {
      var honorsStudent = Student(name: 'Alice', age: 20, program: 'CS', gpa: 3.8);
      var normalStudent = Student(name: 'Bob', age: 21, program: 'IT', gpa: 3.2);

      expect(honorsStudent.isHonors(), isTrue);
      expect(normalStudent.isHonors(), isFalse);
    });

    test('Invalid constructor parameters throw ArgumentError', () {
      expect(() => Student(name: '', age: 20, program: 'CS', gpa: 3.5), throwsArgumentError);
      expect(() => Student(name: 'John', age: 0, program: 'CS', gpa: 3.5), throwsArgumentError);
      expect(() => Student(name: 'John', age: 20, program: 'CS', gpa: 4.5), throwsArgumentError);
    });
  });
}
