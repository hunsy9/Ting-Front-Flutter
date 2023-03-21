import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget startMatching(){
  return Center(
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 15.h),
        child: Container(
          width: 176.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: const Color(0xffd9d9d9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: const Text(
              "매칭이 시작되었습니다.",
              style: TextStyle(
                  fontFamily: 'nanumsquareround',
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ));
}