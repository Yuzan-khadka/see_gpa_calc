import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:see_gpa_generator/models/data.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/models/subject_model.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(getInitialSubject());

  @override
  Stream<SubjectState> mapEventToState(
    SubjectEvent event,
  ) async* {
    if (state is OurSubjectState) {
      if (event is MarksIncrement) {
        yield* _incrementMarks(state, event.index, event.incrementBy);
      } else if (event is MarksDecrement) {
        yield* _decrementMarks(state, event.index, event.decrementBy);
      }
    }
  }
}

Stream<OurSubjectState> _decrementMarks(
  OurSubjectState currentState,
  int index,
  int decrementBy,
) async* {
  List<SubjectModel> subjects = currentState.subjects;
  int newMarks = max(subjects[index].subjectMarks - decrementBy, 0);
  ResultModel newGrade = _getGradeFromMarks(newMarks);
  SubjectModel updatedSubject = SubjectModel(
    grade: newGrade.grade,
    subjectName: subjects[index].subjectName,
    subjectMarks: newMarks,
    gradePoint: newGrade.gradePoint,
  );

  OurSubjectState state = _getNewState(subjects, index, updatedSubject);
  yield state;
}

OurSubjectState _getNewState(
  List<SubjectModel> subjects,
  int index,
  SubjectModel updatedSubject,
) {
  List<SubjectModel> newSubjects = List<SubjectModel>(8);
  for (int i = 0; i < subjects.length; i++) {
    if (i == index) {
      newSubjects[i] = updatedSubject;
    } else {
      newSubjects[i] = subjects[i];
    }
  }
  OurSubjectState state = OurSubjectState(subjects: newSubjects);
  return state;
}

Stream<OurSubjectState> _incrementMarks(
  OurSubjectState currentState,
  int index,
  int incrementBy,
) async* {
  List<SubjectModel> subjects = currentState.subjects;
  int newMarks = min(subjects[index].subjectMarks + incrementBy, 100);
  ResultModel newGrade = _getGradeFromMarks(newMarks);
  SubjectModel updatedSubject = SubjectModel(
    grade: newGrade.grade,
    subjectName: subjects[index].subjectName,
    subjectMarks: newMarks,
    gradePoint: newGrade.gradePoint,
  );

  OurSubjectState state = _getNewState(subjects, index, updatedSubject);
  yield state;
}

ResultModel _getGradeFromMarks(int marks) {
  if (marks >= 90) {
    return ResultModel(grade: 'A+', gradePoint: 4.0);
  } else if (marks >= 80) {
    return ResultModel(grade: 'A', gradePoint: 3.6);
  } else if (marks >= 70) {
    return ResultModel(grade: 'B+', gradePoint: 3.2);
  } else if (marks >= 60) {
    return ResultModel(grade: 'B', gradePoint: 2.8);
  } else if (marks >= 50) {
    return ResultModel(grade: 'C+', gradePoint: 2.4);
  } else if (marks >= 40) {
    return ResultModel(grade: 'C', gradePoint: 2.0);
  } else if (marks >= 30) {
    return ResultModel(grade: 'D+', gradePoint: 1.6);
  } else if (marks >= 20) {
    return ResultModel(grade: 'D', gradePoint: 1.2);
  }
  return ResultModel(grade: 'E', gradePoint: 0.8);
}
