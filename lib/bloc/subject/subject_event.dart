part of 'subject_bloc.dart';

@immutable
abstract class SubjectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MarksIncrement extends SubjectEvent {
  final int index;
  final int incrementBy;

  MarksIncrement({@required this.index, this.incrementBy = 1});

  @override
  List<Object> get props => [index, incrementBy];
}

class MarksDecrement extends SubjectEvent {
  final int index;
  final int decrementBy;

  MarksDecrement({@required this.index, this.decrementBy = 1});

  @override
  List<Object> get props => [index, decrementBy];
}

class SetSubjects extends SubjectEvent{
  final List<SubjectModel> subjectFromHistory;

  SetSubjects({this.subjectFromHistory});

   @override
  List<Object> get props => [subjectFromHistory];
}
