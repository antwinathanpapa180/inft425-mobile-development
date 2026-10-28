// Abstract base class representing any person in the institution
abstract class Person {
  String _name;
  String _id;

  Person({required String name, required String id})
      : _name = name.trim(),
        _id = id.trim() {
    if (_name.isEmpty) throw ArgumentError('Name cannot be empty.');
    if (_id.isEmpty) throw ArgumentError('ID cannot be empty.');
  }

  String get name => _name;
  String get id => _id;

  set name(String newName) {
    if (newName.trim().isEmpty) throw ArgumentError('Name cannot be empty.');
    _name = newName.trim();
  }

  // Abstract method to be implemented by all subclasses
  String getRoleDescription();
}

// Student Subclass (inherits from Person)
class Student extends Person {
  final List<String> _courses = [];

  Student({required super.name, required super.id});

  List<String> get courses => List.unmodifiable(_courses);

  // Added initials getter here
  String get initials {
    List<String> parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }

  void addCourse(String courseName) {
    String trimmed = courseName.trim();
    if (trimmed.isEmpty) throw ArgumentError('Course name cannot be blank.');
    if (_courses.contains(trimmed)) return;
    _courses.add(trimmed);
  }

  @override
  String getRoleDescription() => 'Student: $name (ID: $id) with ${_courses.length} active courses.';
}


// Lecturer Subclass (inherits from Person)
class Lecturer extends Person {
  String _department;
  final List<String> _coursesTaught = [];

  Lecturer({required super.name, required super.id, required String department})
      : _department = department.trim() {
    if (_department.isEmpty) throw ArgumentError('Department cannot be empty.');
  }

  String get department => _department;
  List<String> get coursesTaught => List.unmodifiable(_coursesTaught);

  void assignCourse(String courseName) {
    String trimmed = courseName.trim();
    if (trimmed.isEmpty) throw ArgumentError('Course name cannot be blank.');
    if (!_coursesTaught.contains(trimmed)) {
      _coursesTaught.add(trimmed);
    }
  }

  @override
  String getRoleDescription() => 'Lecturer: $name, Department of $_department.';
}

// Administrator Subclass (inherits from Person)
class Administrator extends Person {
  String _roleTitle;
  final List<String> _permissions = [];

  Administrator({required super.name, required super.id, required String roleTitle})
      : _roleTitle = roleTitle.trim() {
    if (_roleTitle.isEmpty) throw ArgumentError('Role title cannot be empty.');
  }

  String get roleTitle => _roleTitle;
  List<String> get permissions => List.unmodifiable(_permissions);

  void addPermission(String permission) {
    String trimmed = permission.trim();
    if (trimmed.isEmpty) throw ArgumentError('Permission cannot be blank.');
    if (!_permissions.contains(trimmed)) {
      _permissions.add(trimmed);
    }
  }

  @override
  String getRoleDescription() => 'Administrator: $name ($_roleTitle) with ${_permissions.length} permissions.';
}
