import 'package:flutter/material.dart';

const kEdgeInset10 = EdgeInsets.all(10.0);
const kEdgeInset15 = EdgeInsets.all(15.0);

const kWidthBox10 = SizedBox(width: 10);
const kHeightBox10 = SizedBox(height: 10);

const kPrimaryColor = Color(0xFF56D0DB);

const kTileColor = Colors.white;
const kLabelTextColor = Color(0xFF757575);
const kButtonColor = Colors.white;
const kScaffoldColor = Color(0xFFF5F5F5);

const kCalculateButtonTextStyle =
    const TextStyle(fontSize: 20.0, color: Colors.white);

const kBorderRadius10 = BorderRadius.all(Radius.circular(10.0));

const kTitle = Text(
  'SEE GPA Calculator',
);
AppBar appBar = AppBar(
  title: kTitle,
);

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: kLabelTextColor,
);

const kNumStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w500,
  color: Color(0xFF58627D),
);

const kResultSheetGradePointStyle = const TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
  color: Color(0xFF58627D),
);

const kResultSheetGradeStyle = const TextStyle(
  fontSize: 30.0,
  color: Color(0xFF58627D),
);

const kTableHeaderStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
);

const kTableTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 15.0,
);

const kDrawerHeaderTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

const kMethodBoxDecoration =
    BoxDecoration(color: kTileColor, borderRadius: kBorderRadius10, boxShadow: [
  BoxShadow(
    color: Colors.black12,
    offset: Offset(2, 6),
    blurRadius: 6,
  ),
  BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 0),
    blurRadius: 2,
  ),
]);

const kMethodTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
  color: Colors.blueGrey,
);

const kResultSheetButtonTextStyle = TextStyle(
  fontSize: 18.0,
);

const kHistoryTitleStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);

const kDateTimeStyle = TextStyle(fontSize: 10.0);

const kSaveButtonColor = Colors.greenAccent;
const kCancelButtonColor = Colors.redAccent;
