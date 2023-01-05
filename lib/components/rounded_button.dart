import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double elevation;
  final Color buttonBackgroundColor;
  final Function callback;
  final String buttonText;

  const RoundedButton({
    Key key,
    this.elevation,
    @required this.callback,
    this.buttonBackgroundColor,
    @required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: elevation,
        color: buttonBackgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
