// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:typed_data';
import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:ting_flutter/basic_components/basictext.dart';
import 'package:ting_flutter/components/appBar/homeAppbar.dart';
import 'package:ting_flutter/getX/controller/userInfoController.dart';
import 'package:ting_flutter/named_routing/config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/screens/home/controller/MainButtonController.dart';
import 'package:ting_flutter/screens/home/controller/ProfileController.dart';
import 'package:ting_flutter/getX/model/userInfo.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff484749),
        extendBodyBehindAppBar: true,
        body: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 447.w,
              height: 600.h,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
            ),
          ),
          Obx(() {
            UserController userController = Get.put(UserController());
            String myImage = userController.userModel.value.image ?? '0';
            String imageLink = "assets/profile/${myImage}.png";
            return Positioned(
              left: 107.w,
              bottom: 490.h,
              child: Container(
                width: 228.h,
                height: 228.h,
                child: Image.asset(
                  imageLink,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 15.0.w, color: Color(0xfffffff)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1.0,
                      blurRadius: 1.0,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            );
          }),
          Obx(() {
            UserController userController = Get.put(UserController());
            String nickName = userController.userModel.value.nickname!;
            return Positioned(
              top: 395.h,
              child: Container(
                width: 447.w,
                child: Center(
                  child: Text(
                    nickName,
                    style: TextStyle(
                      fontFamily: 'nanumsquareround',
                      fontSize: 30.w,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff978e9b),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            UserController userController = Get.put(UserController());
            String birthYear = userController.userModel.value.birthday!;
            String enterYear = userController.userModel.value.schoolNum!;
            return Positioned(
              top: 433.h,
              child: Container(
                width: 447.w,
                child: Center(
                  child: Text(
                    "${birthYear} | ${enterYear}학번",
                    style: TextStyle(
                      fontFamily: 'nanumsquareround',
                      fontSize: 15.w,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff655c69),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            UserController userController = Get.put(UserController());
            String introduction = "한재안입니다.";
            return Positioned(
              top: 495.h,
              child: Container(
                width: 447.w,
                child: Center(
                  child: Text(
                    introduction,
                    style: TextStyle(
                      fontFamily: 'nanumsquareround',
                      fontSize: 18.w,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4d4d4d),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            UserController userController = Get.put(UserController());
            String schoolName = userController.userModel.value.schoolName!;

            return Positioned(
              top: 570.h,
              child: Container(
                width: 447.w,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/home/crown.png"),
                      Text(
                        schoolName,
                        style: TextStyle(
                          fontFamily: 'nanumsquareround',
                          fontSize: 20.w,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff4d4d4d),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            UserController userController = Get.put(UserController());
            String major = userController.userModel.value.major!;

            return Positioned(
              top: 620.h,
              child: Container(
                width: 447.w,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/home/crown.png"),
                          Text(
                            major,
                            style: TextStyle(
                              fontFamily: 'nanumsquareround',
                              fontSize: 20.w,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff4d4d4d),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => {Navigator.pushNamed(context, "/testAuth")},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff4f2fb),
                            minimumSize: Size(54.w, 26.h),
                            elevation: 0),
                        child: const Text(
                          '테스트 페이지',
                          style: TextStyle(
                              color: Color(0xff986cbf),
                              fontFamily: 'nanumsquareround',
                              fontSize: 12),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {Navigator.pushNamed(context, "/chatRoom")},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff4f2fb),
                            minimumSize: Size(54.w, 26.h),
                            elevation: 0),
                        child: const Text(
                          '채팅 페이지',
                          style: TextStyle(
                              color: Color(0xff986cbf),
                              fontFamily: 'nanumsquareround',
                              fontSize: 12),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
        ]));
  }
}
