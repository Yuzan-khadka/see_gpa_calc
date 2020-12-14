import 'package:flutter/material.dart';
import 'package:see_gpa_generator/screens/method_page/table_parts.dart';
import 'package:see_gpa_generator/shared/constant.dart';


class GradeMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInset10,
      decoration: kMethodBoxDecoration,
      child: Column(
        children: <Widget>[
          const Text(
            'Marks to Grade Conversion',
            style: kMethodTitleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TableHeading('Marks'),
                  const TableItem('90 - 100'),
                  const TableItem('80 - 89'),
                  const TableItem('70 - 79'),
                  const TableItem('60 - 69'),
                  const TableItem('50 - 59'),
                  const TableItem('40 - 49'),
                  const TableItem('30 - 39'),
                  const TableItem('20 - 29'),
                  const TableItem('0 - 19'),
                ],
              ),
              Column(
                children: <Widget>[
                  const TableHeading('Grade'),
                  const TableItem('A+'),
                  const TableItem('A'),
                  const TableItem('B+'),
                  const TableItem('B'),
                  const TableItem('C+'),
                  const TableItem('C'),
                  const TableItem('D+'),
                  const TableItem('D'),
                  const TableItem('E'),
                ],
              ),
              Column(
                children: <Widget>[
                  const TableHeading('Grade Point'),
                  const TableItem('4.0'),
                  const TableItem('3.6'),
                  const TableItem('3.2'),
                  const TableItem('2.8'),
                  const TableItem('2.4'),
                  const TableItem('2.0'),
                  const TableItem('1.6'),
                  const TableItem('1.2'),
                  const TableItem('0.8'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
