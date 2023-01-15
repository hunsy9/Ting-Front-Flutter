import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './screens/kakaoLogin/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToLoginPage() async {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateToLoginPage();
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