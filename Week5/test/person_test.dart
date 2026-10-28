import 'package:test/test.dart';
import '../lib/person.dart';

void main() {
  group('Inheritance & Subclass Tests', () {
    test('Student inherits from Person and manages courses', () {
      var student = Student(name: 'Nathan Antwi', id: 'VVU400');
      expect(student.name, equals('Nathan Antwi'));
      expect(student.id, equals('VVU400'));
      
      student.addCourse('Compiler Design');
      expect(student.courses, contains('Compiler Design'));
      expect(student.getRoleDescription(), contains('Student'));
    });

    test('Lecturer inherits from Person and manages department/courses', () {
      var lecturer = Lecturer(name: 'Dr. Asare', id: 'LEC01', department: 'IT Systems');
      expect(lecturer.department, equals('IT Systems'));
      
      lecturer.assignCourse('Advanced Network Administration');
      expect(lecturer.coursesTaught, contains('Advanced Network Administration'));
      expect(lecturer.getRoleDescription(), contains('Lecturer'));
    });

    test('Administrator inherits from Person and manages permissions', () {
      var admin = Administrator(name: 'Grace Osei', id: 'ADM99', roleTitle: 'System Registrar');
      expect(admin.roleTitle, equals('System Registrar'));
      
      admin.addPermission('Edit_Grades');
      expect(admin.permissions, contains('Edit_Grades'));
      expect(admin.getRoleDescription(), contains('Administrator'));
    });

    test('Abstract base class validation throws on empty fields', () {
      expect(() => Student(name: '', id: '123'), throwsArgumentError);
      expect(() => Lecturer(name: 'Prof', id: '', department: 'CS'), throwsArgumentError);
      expect(() => Administrator(name: 'Boss', id: '01', roleTitle: ''), throwsArgumentError);
    });
  });
}
