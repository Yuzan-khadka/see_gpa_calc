import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:see_gpa_generator/screens/history_page/expanded_container_text.dart';
import 'package:see_gpa_generator/screens/home_page/home_screen.dart';
import 'package:see_gpa_generator/shared/constant.dart';


class ExpandedBox extends StatelessWidget {
  const ExpandedBox({
    Key key,
    @required this.history,
  }) : super(key: key);

  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
            height: 0,
          ),
        ),
        Container(
          height: 290.0,
          child: Card(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            color: kTileColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      itemCount: 1 + history.subjects.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                        final subject = history.subjects[index - 1];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ExpandedContainerText(
                                  text: '${subject.subjectName}'),
                              ExpandedContainerText(
                                  text: '${subject.subjectMarks}'),
                              ExpandedContainerText(text: '${subject.grade}'),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    height: 30.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: kPrimaryColor,
                    onPressed: () {
                      BlocProvider.of<SubjectBloc>(context).add(
                          SetSubjects(subjectFromHistory: history.subjects));
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.route);
                    },
                    child: Text(
                      'Explore',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
