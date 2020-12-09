import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/models/subject_model.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(getInitialHistory());

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is GenerateHistory) {
      yield* addHistory(event.subject, state, event.result);
    }
  }
}

Stream<OurHistoryState> addHistory(OurSubjectState subject,
    OurHistoryState state, OurResultState result) async* {
  final List<HistoryModel> updatedHistory = state.history
    ..insert(
      0,
      HistoryModel(
        dateTime: DateTime.now(),
        subjects: subject,
        result: result,
      ),
    );

  yield OurHistoryState(history: updatedHistory);
}
