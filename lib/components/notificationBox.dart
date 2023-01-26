import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myNotificationBox(context, String who, String date){
  return Container(
    width: 376.w,
    height: 123.h,
    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          blurRadius: 3.0,
          spreadRadius: 0.0,
          offset: const Offset(0,7),
        )
      ]
    ),
    child: Padding(
      padding: EdgeInsets.only(left:28.w , right: 10.h),
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Row(children: [
            Image.asset('assets/images/notification.png',height: 21.h,),
            SizedBox(width: 1.w,),
            const Text(
              '알림',
              style: TextStyle(
                color: Color(0xff414141),
                  fontFamily: 'nanumsquareround', fontSize: 14.92),
            ),
            SizedBox(width: 184.w,),
            Opacity(
              opacity: 0.71,
              child: Text(
                date,
                style: const TextStyle(
                    color: Color(0xff414141),
                    fontFamily: 'nanumsquareround', fontSize: 14.92),
              ),
            ),
            SizedBox(width: 5.w,),
          ],),
          SizedBox(height: 19.h,),
          Row(
            children: [
              Text(
              '${who}님의 팅 초대 요청',
              style: const TextStyle(
                  color: Color(0xff414141),
                  fontFamily: 'nanumsquareround', fontSize: 14.92),
              ),
            ],
          ),
          // SizedBox(height: 8.h,),
          Row(
            children: [
              SizedBox(width: 215.w,),
              ElevatedButton(onPressed: () => {

              }, style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff4f2fb),
                minimumSize: Size(54.w, 26.h),
                elevation: 0

              ), child: const Text(
                '수락',
                style: TextStyle(
                    color: Color(0xff986cbf),
                    fontFamily: 'nanumsquareround', fontSize: 12),
              ),
              ),
              SizedBox(width: 5.w,),
              ElevatedButton(onPressed: () => {

              },style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff4f2fb),
                  minimumSize: Size(54.w, 26.h),
                  elevation: 0
              ), child: const Text(
                '거절',
                style: TextStyle(
                    color: Color(0xff986cbf),
                    fontFamily: 'nanumsquareround', fontSize: 12),
              ),),
            ],
          ),
        ],
      ),
    ),
  );
}