import 'package:flutter/material.dart';

const kEdgeInset10 = EdgeInsets.all(10.0);
const kEdgeInset15 = EdgeInsets.all(15.0);

const kWidthBox10 = SizedBox(width: 10);
const kHeightBox10 = SizedBox(height: 10);

const kPrimaryColor = Color(0xFF0A0E21);
const kTileColor = Color(0xFF1D1E33);
const kLabelTextColor = Color(0xFF8D8D98);
const kButtonColor = Color(0xFF4C4E5F);

const kBorderRadius10 = BorderRadius.all(Radius.circular(10.0));

const kTitle = Text('SEE GPA Calculator');
AppBar appBar = AppBar(title: kTitle);

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: kLabelTextColor,
);

const kNumStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const kTableHeaderStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
);

const kTableTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 15.0,
);

const kMethodBoxDecoration = BoxDecoration(
  color: kTileColor,
  borderRadius: kBorderRadius10
);

const kMethodTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
  color: Colors.blueGrey,
);
