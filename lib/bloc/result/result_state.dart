part of 'result_bloc.dart';

abstract class ResultState extends Equatable {
  const ResultState();
  
  @override
  List<Object> get props => [];
}

OurResultState getInitialResult() {
  return OurResultState(result: ResultModel(grade: 'A+', gradePoint: 3.6));
}

class OurResultState extends ResultState {
  final ResultModel result;

  OurResultState({@required this.result});

  @override
  List<Object> get props => [result];
}
