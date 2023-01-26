// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class BasicButton extends StatefulWidget {
  const BasicButton({
    required this.width, 
    required this.height, 
    required this.text, 
    required this.onpressed
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback onpressed;

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ButtonTheme(
        child: TextButton(
          onPressed: widget.onpressed,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: Color.fromARGB(255, 120, 71, 164),
                fontFamily: 'nanumsquareround',
                fontSize: 20.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff675bc9).withOpacity(0.2)),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
