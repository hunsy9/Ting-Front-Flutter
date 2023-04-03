import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar statusBarColor(SystemUiOverlayStyle colors){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    systemOverlayStyle: colors,
  );
}

AppBar baseAppBar(String title){
  return AppBar(
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xff414141),
          fontFamily: 'nanumsquareround', fontSize: 20),
    ),
    backgroundColor: Colors.white,
    elevation: 0.2,
  );
}