import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/screens/result_sheet.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onCalcBtnPress(BuildContext context, OurSubjectState subjectState) {
      showModalBottomSheet(
        context: context,
        backgroundColor: kPrimaryColor,
        builder: (context) {
          return ResultSheet(subjectState: subjectState);
        },
      );
    }

    return BlocConsumer<SubjectBloc, SubjectState>(
      listener: (context, state) {
        if (state is OurSubjectState) {
          BlocProvider.of<ResultBloc>(context)
              .add(CalculateResult(state.subjects));
        }
      },
      builder: (context, state) {
        return RaisedButton(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          color: Colors.blueGrey,
          onPressed: () {
            _onCalcBtnPress(context, state);
          },
          child: Text(
            'CALCULATE',
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        );
      },
    );
  }
}
