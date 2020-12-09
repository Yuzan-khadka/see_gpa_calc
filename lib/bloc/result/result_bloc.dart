import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/models/subject_model.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(getInitialResult());

  @override
  Stream<ResultState> mapEventToState(
    ResultEvent event,
  ) async* {
    if (event is CalculateResult) {
      double gpa = calculate(event.subjects);

      if (gpa >= 3.6) {
        yield OurResultState(
          result: ResultModel(grade: 'A+', gradePoint: gpa),
        );
      } else if (gpa >= 3.2) {
        yield OurResultState(
          result: ResultModel(grade: 'A', gradePoint: gpa),
        );
      } else if (gpa > 2.8) {
        yield OurResultState(
          result: ResultModel(grade: 'B+', gradePoint: gpa),
        );
      } else if (gpa > 2.4) {
        yield OurResultState(
          result: ResultModel(grade: 'B', gradePoint: gpa),
        );
      } else if (gpa > 2.0) {
        yield OurResultState(
          result: ResultModel(grade: 'C+', gradePoint: gpa),
        );
      } else if (gpa > 1.6) {
        yield OurResultState(
          result: ResultModel(grade: 'C', gradePoint: gpa),
        );
      } else if (gpa > 1.2) {
        yield OurResultState(
          result: ResultModel(grade: 'D+', gradePoint: gpa),
        );
      } else if (gpa > 0.8) {
        yield OurResultState(
          result: ResultModel(grade: 'D', gradePoint: gpa),
        );
      } else {
        yield OurResultState(
          result: ResultModel(grade: 'E', gradePoint: gpa),
        );
      }
    }
  }
}

double calculate(List<SubjectModel> subjects) {
  double gpa = 0;
  gpa = subjects.fold(
          gpa, (previousValue, subject) => previousValue + subject.gradePoint) /
      8;
  return gpa;
}
