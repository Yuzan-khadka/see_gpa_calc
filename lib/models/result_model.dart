class ResultModel {
  final String grade;
  final double gradePoint;

  ResultModel({this.grade, this.gradePoint});

  Map<String, dynamic> toMap() {
    return {
      'grade': grade,
      'gradePoint': gradePoint,
    };
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      grade: map['grade'],
      gradePoint: map['gradePoint'],
    );
  }
}
