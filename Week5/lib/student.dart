class Student {
  String name;
  int age;
  String program;
  double gpa;
  final List<String> _courses = [];

  Student({
    required this.name,
    required this.age,
    required this.program,
    required this.gpa,
    List<String>? courses,
  }) {
    if (name.trim().isEmpty) throw ArgumentError('Name cannot be empty.');
    if (age <= 0) throw ArgumentError('Age must be valid.');
    if (gpa < 0.0 || gpa > 4.0) throw ArgumentError('GPA must be between 0.0 and 4.0.');
    if (courses != null) {
      _courses.addAll(courses);
    }
  }

  // Getters
  List<String> get courses => List.unmodifiable(_courses);
  int get ageInMonths => age * 12;

  String get initials {
    List<String> parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }

  // Methods requested by manual
  void addCourse(String courseName) {
    String trimmed = courseName.trim();
    if (trimmed.isEmpty) throw ArgumentError('Course name cannot be blank.');
    if (!_courses.contains(trimmed)) {
      _courses.add(trimmed);
    }
  }

  bool isHonors() => gpa >= 3.6;

  void displayInfo() {
    print('Name: $name ($age years old)');
    print('Program: $program | GPA: $gpa');
    print('Courses: ${_courses.isEmpty ? "No courses enrolled" : _courses.join(", ")}');
    print('Initials: $initials | Age in Months: $ageInMonths');
    print('-----------------------------------');
  }

  @override
  String toString() => 'Student: $name [ID/Program: $program, GPA: $gpa]';
}
