import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/screens/result_page/expanded_flat_button.dart';
import 'package:see_gpa_generator/screens/result_page/save_dialog.dart';
import 'package:see_gpa_generator/shared/constant.dart';




class ResultSheet extends StatelessWidget {
  void _onSaveButtonPress(BuildContext context) {
    showDialog(context: context, builder: (context) => SaveDialog());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, resultState) {
        ResultModel result = (resultState as OurResultState).result;
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
                          style: kResultSheetGradePointStyle,
                        ),
                        kWidthBox10,
                        Text(
                          "(${result.grade})",
                          style: kResultSheetGradeStyle,
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
                    color: kSaveButtonColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      _onSaveButtonPress(context);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ExpandedFlatbutton(
                    color: kTileColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: kResultSheetButtonTextStyle,
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
