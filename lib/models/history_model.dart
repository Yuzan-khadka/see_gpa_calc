import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';

class HistoryModel {
  final OurSubjectState subjects;
  final OurResultState result;
  final DateTime dateTime;
  bool isExpanded;

  HistoryModel(
      {this.subjects, this.result, this.dateTime, this.isExpanded = false});

  Map<String, dynamic> toMap() {
    return {
      'subjectState': subjects,
      'resultState': result,
      'dateTime': dateTime,
      'isExpanded': isExpanded
    };
  }

  static HistoryModel fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      subjects: map['subjectState'],
      result: map['resultState'],
      dateTime: map['dateTime'],
      isExpanded: map['isExpanded'],
    );
  }
}
