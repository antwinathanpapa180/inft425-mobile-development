import '../lib/student.dart';

void main() {
  print('=============================================');
  print('     VVU MOBILE DEV: WEEK 5 OOP DEMO         ');
  print('=============================================');

  // Creating Student objects
  var student1 = Student(
    name: 'Nathan Papa',
    age: 23,
    program: 'Computer Science',
    gpa: 3.9,
    courses: ['Mobile App Development', 'Compiler Design'],
  );

  var student2 = Student(
    name: 'Ama Serwaa',
    age: 21,
    program: 'Information Technology',
    gpa: 3.5,
    courses: ['Database Systems', 'Cloud Computing'],
  );

  var student3 = Student(
    name: 'Kofi Mensah',
    age: 22,
    program: 'Software Engineering',
    gpa: 3.75,
    courses: ['Data Structures', 'Cyber Security'],
  );

  print('\n=== 1. PRINTING INITIAL STUDENT DETAILS ===');
  student1.displayInfo();
  student2.displayInfo();
  student3.displayInfo();

  print('\n=== 2. ADDING A COURSE DYNAMICALLY ===');
  print('Adding "Advanced Flutter" to ${student2.name}...');
  student2.addCourse('Advanced Flutter');
  student2.displayInfo();

  print('\n=== 3. CHECKING HONORS STATUS (GPA >= 3.6) ===');
  print('${student1.name} is Honors: ${student1.isHonors()}');
  print('${student2.name} is Honors: ${student2.isHonors()}');
  print('${student3.name} is Honors: ${student3.isHonors()}');
  print('-----------------------------------');

  print('\n=== 4. USING toString() OVERRIDE ===');
  print(student1.toString());
  print(student2.toString());
  print(student3.toString());
  print('=============================================');
  print('           DEMO COMPLETED SUCCESSFULLY       ');
  print('=============================================');
}
