import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/result/result_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/database/history_dao.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:see_gpa_generator/models/result_model.dart';
import 'package:see_gpa_generator/models/subject_model.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class SaveDialog extends StatefulWidget {
  @override
  _SaveDialogState createState() => _SaveDialogState();
}

class _SaveDialogState extends State<SaveDialog> {
  final TextEditingController _textController = TextEditingController();

  _buildSaveButton(String label, Color color, Function onPress) {
    return FlatButton(
      color: color,
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  bool _isDisplayFieldError = false;

  @override
  Widget build(BuildContext context) {
    final HistoryDao _historyDao = HistoryDao();
    return AlertDialog(
      contentPadding: EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter a name',
                errorText: _isDisplayFieldError ? 'Text Field is empty' : null,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<SubjectBloc, SubjectState>(
                  builder: (context, subjectState) {
                List<SubjectModel> subject =
                    (subjectState as OurSubjectState).subjects;
                return BlocBuilder<ResultBloc, ResultState>(
                    builder: (context, resultState) {
                  ResultModel result = (resultState as OurResultState).result;
                  return _buildSaveButton('Add', kSaveButtonColor, () async {
                    if (_textController.text.isEmpty) {
                      setState(() {
                        _isDisplayFieldError = true;
                      });
                    } else {
                      await _historyDao.insertData(
                        HistoryModel(
                            name: _textController.text.trim(),
                            subjects: subject,
                            result: result,
                            dateTime: DateTime.now(),
                            isExpanded: false),
                      );

                      Navigator.pop(context);
                    }
                  });
                });
              }),
              _buildSaveButton('Cancel', kCancelButtonColor, () {
                Navigator.pop(context);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
