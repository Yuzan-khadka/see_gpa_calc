import 'package:flutter/material.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class TableHeading extends StatelessWidget {
  final String text;

  const TableHeading(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: kTableHeaderStyle,
      ),
    );
  }
}

class TableItem extends StatelessWidget {
  final String text;

  const TableItem(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: kTableTextStyle,
      ),
    );
  }
}
