import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/components/myAppBar.dart';

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
      backgroundColor: Colors.white,
     appBar: baseAppBar("추천 장소"),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 180.h,),
            Image.asset('assets/images/ux_mobile.png',height: 256.h,),
            const Text(
              '아직 준비중이에요!',
              style: TextStyle(
                  color: Color(0xff414141),
                  fontFamily: 'nanumsquareround', fontSize: 14.92),
            ),
          ],
        ),
        ),
      );
  }
}