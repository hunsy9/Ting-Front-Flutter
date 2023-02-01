import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget TabContainer(bool trigger, String originalImage, String afterImage ){

  bool _trigger = trigger;

  return Container(
    height: 90.h,
    child: Tab(
        icon: Column(
          children: [
            AnimatedPadding(
              child: _trigger?Image.asset(afterImage) : Image.asset(originalImage),
              padding: _trigger
                  ? EdgeInsets.only(bottom: 20.h)
                  : EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        )),
  );
}