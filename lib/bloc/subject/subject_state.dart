part of 'subject_bloc.dart';

@immutable
abstract class SubjectState extends Equatable {
  @override
  List<Object> get props => [];
}

OurSubjectState getInitialSubject() {
  return OurSubjectState(subjects: InitialData().initialSubjectList);
}

class OurSubjectState extends SubjectState {
  final List<SubjectModel> subjects;
  OurSubjectState({this.subjects});

  @override
  List<Object> get props => [subjects];
}
