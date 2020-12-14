import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/screens/result_page/result_sheet.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onCalcBtnPress(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return ResultSheet();
        },
      );
    }

    return BlocListener<SubjectBloc, SubjectState>(
      listener: (context, subjectState) {
        if (subjectState is OurSubjectState) {
          BlocProvider.of<ResultBloc>(context)
              .add(CalculateResult(subjectState.subjects));
        }
      },
      child: RaisedButton(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: kPrimaryColor,
        onPressed: () async {
          _onCalcBtnPress(context);
        },
        child: Text(
          'CALCULATE',
          style: kCalculateButtonTextStyle,
        ),
      ),
    );
  }
}
