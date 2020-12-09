part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

OurHistoryState getInitialHistory() {
  return OurHistoryState(history: <HistoryModel>[]);
}

class OurHistoryState extends HistoryState {
  final List<HistoryModel> history;

  OurHistoryState({this.history});

  @override
  List<Object> get props => [history];
}
