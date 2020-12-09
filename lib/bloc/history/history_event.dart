part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}
class GenerateHistory extends HistoryEvent{
  final OurSubjectState subject;
  final OurResultState result;

  GenerateHistory({this.subject, this.result});

  @override
  List<Object> get props => [subject, result];
}