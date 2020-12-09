import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/models/subject_model.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/home/change_button.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key key,
    @required this.subject,
    @required this.index,
    this.subjectState,

  }) : super(key: key);

  final SubjectModel subject;
  final int index;
  final OurSubjectState subjectState;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kTileColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${subject.subjectName.toUpperCase()}",
            style: kLabelStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                subject.subjectMarks.toString(),
                style: kNumStyle,
              ),
              const SizedBox(width: 5.0),
              Text(
                "(${subject.grade})",
                style: kLabelStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChangeButton(
                icon: Icons.remove,
                onPress: () {
                  if (subject.subjectMarks > 0) {
                    BlocProvider.of<SubjectBloc>(context)
                        .add(MarksDecrement(index: index));
                  }
                },
              ),
              kWidthBox10,
              ChangeButton(
                icon: Icons.add,
                onPress: () {
                  if (subject.subjectMarks < 100) {
                    BlocProvider.of<SubjectBloc>(context)
                        .add(MarksIncrement(index: index));
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
