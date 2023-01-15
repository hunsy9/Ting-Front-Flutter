import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedPlaceScreen extends StatefulWidget {
  const RecommendedPlaceScreen({Key? key}) : super(key: key);

  @override
  _RecommendedPlaceScreenState createState() => _RecommendedPlaceScreenState();
}

class _RecommendedPlaceScreenState extends State<RecommendedPlaceScreen> {

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
                const Text("추천장소 라우터")
              ],
            )
        ),
      ),
    );
  }
}