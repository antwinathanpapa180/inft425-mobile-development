import 'person.dart';

// Mixin for anything that can be evaluated/graded
mixin Evaluable {
  double get gradeScore;
  bool get hasPassed => gradeScore >= 50.0;
  
  String getEvaluationSummary() => hasPassed ? 'Passed (Score: $gradeScore)' : 'Failed (Score: $gradeScore)';
}

// Course Class representing institutional courses
class Course {
  final String courseCode;
  final String courseTitle;
  final int creditHours;
  
  Course({required this.courseCode, required this.courseTitle, required this.creditHours}) {
    if (courseCode.trim().isEmpty || courseTitle.trim().isEmpty) {
      throw ArgumentError('Course code and title cannot be empty.');
    }
    if (creditHours <= 0) {
      throw ArgumentError('Credit hours must be greater than zero.');
    }
  }

  @override
  String toString() => '[$courseCode] $courseTitle ($creditHours Credits)';
}
