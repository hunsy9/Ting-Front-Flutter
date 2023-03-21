import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './chatProfileModal.dart';
import '../../../getX/controller/userInfoController.dart';

Widget chatProfile(BuildContext context) {
  UserController userController = Get.find<UserController>();
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (
            context,
          ) {
            return Center(child: chatProfileModal(context));
          });
    },
    child: Container(
      margin: const EdgeInsets.only(right: 6.0),
      height: 48.h,
      width: 48.h,
      padding: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: const Color(0xbc98a6d4),
            style: BorderStyle.solid,
            width: 2.w,
          )),
      child: Image.asset(
        'assets/profile/${userController.userModel.value.image}.png',
        height: 35.h,
      ),
    ),
  );
}
