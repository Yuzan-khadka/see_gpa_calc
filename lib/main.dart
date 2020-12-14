import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:see_gpa_generator/bloc/subject/subject_bloc.dart';
import 'package:see_gpa_generator/screens/history_page/history_screen.dart';
import 'package:see_gpa_generator/screens/home_page/home_screen.dart';
import 'package:see_gpa_generator/screens/method_page/method_screen.dart';
import 'package:see_gpa_generator/shared/constant.dart';

import 'bloc/result/result_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubjectBloc>(
          create: (context) => SubjectBloc(),
        ),
        BlocProvider<ResultBloc>(
          create: (context) => ResultBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'SEE GPA CALCULATOR',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
           primaryColor: kPrimaryColor,
           scaffoldBackgroundColor: kScaffoldColor,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: HomeScreen.route,
        routes: {
          HomeScreen.route: (context) => HomeScreen(),
          MethodScreen.route: (context) => MethodScreen(),
          HistoryScreen.route: (context) => HistoryScreen(),
        },
      ),
    );
  }
}
