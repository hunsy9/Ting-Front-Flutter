import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/home.dart';
import 'package:transition/transition.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 200.h,),
                    Center(
                        child: Image.asset('assets/xhdpi/Ting_logo.png',height: 180.h,)
                    ),
                    SizedBox(height: 200.h,),
                    GestureDetector(
                      onTap: ()=>{
    Navigator.push(
    context, Transition(
        child: Home(),
        transitionEffect: TransitionEffect.FADE))
    },

                      child: Container(
                        height: 180.h,
                        width: 300.w,
                        child: Image.asset('assets/xhdpi/kakao_login_large_wide.png',height: 180.h,),),
                    )

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}