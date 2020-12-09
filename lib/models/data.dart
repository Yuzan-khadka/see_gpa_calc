import 'package:see_gpa_generator/models/subject_model.dart';

class InitialData {
  List<SubjectModel> _initialLists = [
    SubjectModel(
        subjectName: "English", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Nepali", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Maths", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Science", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Social", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Health", subjectMarks: 80, grade: 'A', gradePoint: 3.6),
    SubjectModel(
        subjectName: "Optional 1",
        subjectMarks: 80,
        grade: 'A',
        gradePoint: 3.6),
    SubjectModel(
        subjectName: "Optional 2",
        subjectMarks: 80,
        grade: 'A',
        gradePoint: 3.6),
  ];

  List<SubjectModel> get initialSubjectList => _initialLists;
}
