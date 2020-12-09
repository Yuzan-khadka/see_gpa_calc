import 'package:flutter/material.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class ExpandedFlatbutton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  ExpandedFlatbutton({this.child, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: kTileColor,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
