import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/models/subject_model.dart';

class HistoryModel {
  int id;
  final String name;
  final List<SubjectModel> subjects;
  final ResultModel result;
  final DateTime dateTime;
  bool isExpanded;

  HistoryModel(
      {this.name, this.subjects, this.result, this.dateTime, this.isExpanded});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subjects': subjects.map((subject) => subject.toMap()).toList(),
      'result': result.toMap(),
      'dateTime': dateTime.toIso8601String(),
      'isExpanded': isExpanded
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      name: map['name'],
      subjects: map['subjects']
          .map((subject) => SubjectModel.fromMap(subject))
          .toList()
          .cast<SubjectModel>(),
      result: ResultModel.fromMap(map['result']),
      dateTime: DateTime.tryParse(map['dateTime']),
      isExpanded: map['isExpanded'],
    );
  }

  // HistoryModel copyWith({
  //   List<SubjectModel> subjects,
  //   ResultModel result,
  //   DateTime dateTime,
  //   bool isExpanded,
  // }) {
  //   return HistoryModel(
  //     subjects: subjects ?? this.subjects,
  //     result: result ?? this.result,
  //     dateTime: dateTime ?? this.dateTime,
  //     isExpanded: isExpanded ?? this.isExpanded,
  //   );
  // }
}
