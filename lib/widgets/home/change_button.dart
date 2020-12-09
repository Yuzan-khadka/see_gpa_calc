import 'package:flutter/material.dart';
import 'package:see_gpa_generator/shared/constant.dart';

class ChangeButton extends StatefulWidget {
  const ChangeButton({
    Key key,
    this.icon,
    this.onPress,
  }) : super(key: key);

  final IconData icon;
  final Function onPress;

  @override
  _ChangeButtonState createState() => _ChangeButtonState();
}

class _ChangeButtonState extends State<ChangeButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      onLongPressStart: (_) async {
        isPressed = true;
        do {
          widget.onPress();
          await Future.delayed(Duration(milliseconds: 50));
        } while (isPressed);
      },
      onLongPressEnd: (_) => setState(() => isPressed = false),
      child: Container(
        constraints: const BoxConstraints.tightFor(width: 40.0, height: 40.0),
        decoration: BoxDecoration(
          color: kButtonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(widget.icon),
      ),
    );
  }
}
