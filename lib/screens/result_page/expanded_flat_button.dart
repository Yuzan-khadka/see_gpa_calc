import 'package:flutter/material.dart';

class ExpandedFlatbutton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color color;

  ExpandedFlatbutton({this.child, @required this.onPressed, this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: color,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
