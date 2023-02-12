import 'package:flutter/material.dart';

class basicText extends StatefulWidget {
  basicText({required this.text, this.fontSize=23.2});

  final String text;
  double fontSize = 23.2;

  @override
  State<basicText> createState() => _basicTextState();
}

class _basicTextState extends State<basicText> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      widget.text,
      style: TextStyle(
        fontFamily: 'nanumsquareround',
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w800,
      ),
      textAlign: TextAlign.start,
    );
  }
}
