import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _isTokenExpired() async{

    try {
      await UserApi.instance.accessTokenInfo();
    } catch (error) {
        Future.delayed(const Duration(seconds: 3), (){
              Navigator.pushNamed(context, '/login');
            });
        return;
    }
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushNamed(context, '/home');
    });

  }

  @override
  void initState() {
    super.initState();
    _isTokenExpired();
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