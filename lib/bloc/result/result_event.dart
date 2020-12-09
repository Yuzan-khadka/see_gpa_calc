part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class CalculateResult extends ResultEvent {
  final List<SubjectModel> subjects;

  CalculateResult(this.subjects);

  @override
  List<Object> get props => [subjects];
}
