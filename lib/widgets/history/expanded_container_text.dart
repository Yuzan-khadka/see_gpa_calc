import 'package:flutter/material.dart';

class ExpandedContainerText extends StatelessWidget {
  const ExpandedContainerText({
    Key key,
    this.text,
    this.header = false,
  }) : super(key: key);

  final String text;
  final bool header;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: header ? Colors.green : Colors.white),
    ));
  }
}
