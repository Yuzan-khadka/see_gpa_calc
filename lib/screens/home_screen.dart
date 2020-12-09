import 'package:flutter/material.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/app_drawer.dart';
import 'package:see_gpa_generator/widgets/home/calculate_button.dart';
import 'package:see_gpa_generator/widgets/home/subject_grid_view.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SubjectGridView(),
          CalculateButton(),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
