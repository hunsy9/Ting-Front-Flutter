import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar statusBarColor(SystemUiOverlayStyle colors){
  return AppBar(
    backgroundColor: Color(0xffbebebe),
    elevation: 0.0,
    systemOverlayStyle: colors,
  );
}

AppBar homeAppBar(String title,context){
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xff414141),
          fontFamily: 'nanumsquareround', fontSize: 20),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Image.asset('assets/images/notification.png',width: 31.w,height: 27.h,),
        onPressed: () {
          Navigator.pushNamed(context, "/alarm");
        },
      ),
    ],
  );
}