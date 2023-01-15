import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      extendBodyBehindAppBar: true,
      body: Center(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 200.h,),
                Center(
                    child: Image.asset('assets/images/Ting_Login_Logo.png',height: 180.h,)
                ),
                SizedBox(height: 200.h,),
                const Text("내 프로필 라우터")
              ],
            )
        ),
      ),
    );
  }
}