import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/app_drawer.dart';
import 'package:see_gpa_generator/widgets/method/gpa_method.dart';
import 'package:see_gpa_generator/widgets/method/grade_method.dart';

class MethodScreen extends StatelessWidget {
  static const String route = 'method';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kEdgeInset10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GradeMethod(),
              kHeightBox10,
              GpaMethod(),
            ],
          ),
        ),
      ),
    );
  }
}
