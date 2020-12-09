import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/widgets/home/subject_card.dart';

class SubjectGridView extends StatelessWidget {
  const SubjectGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return BlocBuilder<SubjectBloc, SubjectState>(
      builder: (context, state) {
        OurSubjectState subjectState = state as OurSubjectState;
        return Expanded(
          child: GridView.builder(
              padding: EdgeInsets.only(
                top: 15.0,
                left: 15.0,
                right: 15.0,
                bottom: 10.0,
              ),
              itemCount: subjectState.subjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: orientation == Orientation.portrait ? 1 : 2),
              itemBuilder: (context, index) {
                final subject = subjectState.subjects[index];
                return SubjectCard(subject: subject, index: index, subjectState: subjectState);
              }),
        );
      },
    );
  }
}
