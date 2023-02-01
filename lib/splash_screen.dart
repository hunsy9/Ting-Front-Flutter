import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:ting_flutter/named_routing/config.dart';

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
    Future.delayed(const Duration(seconds: 3), ()async{
      Navigator.pushNamed(context, NavigatorViewRoute);
      var url = 'http://localhost:8080/api/v1/user/signin/2222';
      final response = await http.get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
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