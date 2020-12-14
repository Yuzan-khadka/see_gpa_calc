import 'package:flutter/material.dart';
import 'package:see_gpa_generator/screens/method_page/table_parts.dart';
import 'package:see_gpa_generator/shared/constant.dart';


class GpaMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInset10,
      decoration: kMethodBoxDecoration,
      child: Column(
        children: <Widget>[
          const Text(
            'Grade Point Average',
            style: kMethodTitleStyle,
          ),
          Padding(
            padding: kEdgeInset10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('GPA = '),
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      margin: const EdgeInsets.only(bottom: 2.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: const Text('Sum of Grade Points'),
                    ),
                    const Text('No. of subjects(8)'),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TableHeading('GPA'),
                  const TableItem('3.6 - 4.0'),
                  const TableItem('3.2 - 3.55'),
                  const TableItem('2.8 - 3.15'),
                  const TableItem('2.4 - 2.75'),
                  const TableItem('2.0 - 2.35'),
                  const TableItem('1.6 - 1.95'),
                  const TableItem('1.2 - 1.55'),
                  const TableItem('0.8 - 1.15'),
                  const TableItem('less than 0.8'),
                ],
              ),
              Column(
                children: <Widget>[
                  TableHeading('Final Grade'),
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
            ],
          ),
        ],
      ),
    );
  }
}
