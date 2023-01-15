import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AdditionalAuthScreen extends StatefulWidget {
  const AdditionalAuthScreen({Key? key}) : super(key: key);

  @override
  _AdditionalAuthScreenState createState() => _AdditionalAuthScreenState();
}

class _AdditionalAuthScreenState extends State<AdditionalAuthScreen> {

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
                const Text("추가인증 라우터")
              ],
            )
        ),
      ),
    );
  }
}