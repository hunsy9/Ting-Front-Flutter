import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



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
                        child: Image.asset('assets/images/Ting_Login_Logo.png',height: 180.h,)
                    ),
                    SizedBox(height: 200.h,),
                    GestureDetector(
                      onTap: ()=>{
                          Navigator.pushNamed(
                          context, '/home')
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