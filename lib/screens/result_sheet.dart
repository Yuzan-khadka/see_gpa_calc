import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/history/history_bloc.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/result/expanded_flat_button.dart';

const kButtonTextStyle = const TextStyle(fontSize: 18.0);

class ResultSheet extends StatelessWidget {
  final OurSubjectState subjectState;
  ResultSheet({this.subjectState});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        ResultModel result = (state as OurResultState).result;
        return Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                decoration: const BoxDecoration(
                  color: kTileColor,
                  borderRadius: kBorderRadius10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Your results is",
                      style: kLabelStyle,
                    ),
                    kHeightBox10,
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          result.gradePoint.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        kWidthBox10,
                        Text(
                          "(${result.grade})",
                          style: const TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: kEdgeInset15,
              child: Row(
                children: <Widget>[
                  ExpandedFlatbutton(
                    onPressed: () {
                      Navigator.pop(context);
                      BlocProvider.of<HistoryBloc>(context).add(GenerateHistory(
                          subject: subjectState, result: state));
                    },
                    child: const Text(
                      'OK',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
