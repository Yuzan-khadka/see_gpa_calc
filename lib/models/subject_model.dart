class SubjectModel {
  final String subjectName;
  final int subjectMarks;
  final String grade;
  final double gradePoint;

  SubjectModel(
      {this.subjectName, this.subjectMarks, this.grade, this.gradePoint});

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'subjectMarks': subjectMarks,
      'grade': grade,
      'gradePoint': gradePoint,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map){
    return SubjectModel(
      subjectName: map['subjectName'],
      subjectMarks: map['subjectMarks'],
      grade: map['grade'],
      gradePoint: map['gradePoint'],
    );
  }
}
