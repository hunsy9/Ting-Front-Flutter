import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/screens/kakaoLogin/initialLogic.dart';

import 'getX/controller/userInfoController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    initialize(context);
  }


  @override
  Widget build(BuildContext context) {

    final UserController controller = Get.put(UserController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: double.infinity,
                child: Center(
                    child: Image.asset('assets/images/Ting_Logo.png',height: 100.h,)
                )
            ),
          )
        ],
      ),
    );
  }
}