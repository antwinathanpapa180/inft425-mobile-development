import 'package:week5/person.dart';
import 'package:week5/system_core.dart';

void main() {
  print('==================================================');
  print('      VALLEY VIEW UNIVERSITY SYSTEM INTEGRATION   ');
  print('==================================================\n');

  // 1. Create Courses
  var mobileDev = Course(courseCode: 'CITS411', courseTitle: 'Mobile App Development', creditHours: 3);
  var compilerDesign = Course(courseCode: 'CITS412', courseTitle: 'Compiler Design', creditHours: 4);

  print('--- CREATED COURSES ---');
  print(mobileDev);
  print(compilerDesign);

  // 2. Create Lecturers & Assign Courses
  var lecturer = Lecturer(name: 'Dr. Mensah', id: 'LEC-001', department: 'Computer Science');
  lecturer.assignCourse(mobileDev.courseTitle);
  lecturer.assignCourse(compilerDesign.courseTitle);

  print('\n--- LECTURER DETAILS ---');
  print(lecturer.getRoleDescription());
  print('Courses Taught: ${lecturer.coursesTaught.join(", ")}');

  // 3. Create Students and Enroll in Courses
  var student = Student(name: 'Nathan Papa', id: 'VVU-2026-04');
  student.addCourse(mobileDev.courseTitle);
  student.addCourse(compilerDesign.courseTitle);

  print('\n--- STUDENT DETAILS ---');
  print(student.getRoleDescription());
  print('Enrolled Courses: ${student.courses.join(", ")}');
  print('Initials: ${student.initials}');

  // 4. Create Administrator
  var admin = Administrator(name: 'Mrs. Ocloo', id: 'ADM-99', roleTitle: 'University Registrar');
  admin.addPermission('APPROVE_GRADES');
  admin.addPermission('ENROLL_STUDENTS');

  print('\n--- ADMINISTRATOR DETAILS ---');
  print(admin.getRoleDescription());
  print('Permissions Granted: ${admin.permissions.join(", ")}');

  print('\n==================================================');
  print('    STUDENT MANAGEMENT SYSTEM DEMO COMPLETED      ');
  print('==================================================');
}
