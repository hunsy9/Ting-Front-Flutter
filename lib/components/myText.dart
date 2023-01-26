import 'package:flutter/material.dart';

Text basicText(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'nanumsquareround',
      fontSize: fontSize,
    ),
  );
}
