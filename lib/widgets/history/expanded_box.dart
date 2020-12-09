import 'package:flutter/material.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/history/expanded_container_text.dart';

class ExpandedBox extends StatelessWidget {
  const ExpandedBox({
    Key key,
    @required this.history,
  }) : super(key: key);

  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      color: kTileColor,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 5.0),
          itemCount: 1 + history.subjects.subjects.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end,
                  children: [
                    ExpandedContainerText(
                      text: 'Subjects',
                      header: true,
                    ),
                    ExpandedContainerText(
                      text: 'Marks',
                      header: true,
                    ),
                    ExpandedContainerText(
                      text: 'Grade',
                      header: true,
                    ),
                  ],
                ),
              );
            }
            final subject =
                history.subjects.subjects[index - 1];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  ExpandedContainerText(
                      text: '${subject.subjectName}'),
                  ExpandedContainerText(
                      text: '${subject.subjectMarks}'),
                  ExpandedContainerText(
                      text: '${subject.grade}'),
                ],
              ),
            );
          }),
    );
  }
}
