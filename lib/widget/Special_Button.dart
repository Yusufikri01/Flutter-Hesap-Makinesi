import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color backgroundcolor;
  final Color textcolor;

  SpecialButton(
      this.onPressed, this.text, this.backgroundcolor, this.textcolor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 28),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
