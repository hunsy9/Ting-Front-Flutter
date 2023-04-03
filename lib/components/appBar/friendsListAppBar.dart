import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar statusBarColor(SystemUiOverlayStyle colors) {
  return AppBar(
    backgroundColor: const Color(0xffbebebe),
    elevation: 0.0,
    systemOverlayStyle: colors,
  );
}

AppBar friendsListAppBar() {
  return AppBar(
    centerTitle: true,
    title: const Text(
      '친구 목록',
      style: TextStyle(
          color: Color(0xff414141),
          fontFamily: 'nanumsquareround',
          fontSize: 20),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
          onPressed: () {
            print('hello');
          },
          icon: const Icon(Icons.search, color: Colors.black))
    ],
  );
}
