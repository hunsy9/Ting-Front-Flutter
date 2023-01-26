import 'package:flutter/material.dart';

class basicText extends StatefulWidget {
  const basicText({required this.text});

  final String text;

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
        fontSize: 23.2,
      ),
      textAlign: TextAlign.start,
    );
  }
}
