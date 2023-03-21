import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myNoticeBox(context,String date,String summarize){
  return Container(
    width: 397.w,
    height: 93.h,
    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20.h),
    decoration: BoxDecoration(color: Colors.white ,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          blurRadius: 3.0,
          spreadRadius: 0.0,
          offset: const Offset(0,7),
        )]),
    child: Padding(
      padding: EdgeInsets.only(left:32.w , right: 10.h),
      child: Column(
        children: [
          SizedBox(height: 18.h,),
          Row(
            children: [
              const Text(
                '공지사항',
                style: TextStyle(
                    color: Color(0xff414141),
                    fontFamily: 'nanumsquareround', fontSize: 14.92),
              ),
              SizedBox(width: 187.w,),
              Opacity(
                opacity: 0.49,
                child: Text(
                  date,
                  style: const TextStyle(
                      color: Color(0xff414141),
                      fontFamily: 'nanumsquareround', fontSize: 14.92),
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h,child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Image.asset('assets/images/chevron-right.png')],
          )),
          Row(children: [
            Opacity(
              opacity: 0.71,
              child: Text(
                summarize,
                style: const TextStyle(
                    color: Color(0xff414141),
                    fontFamily: 'nanumsquareround', fontSize: 13),
              ),
            ),
          ],
          )
        ],
      ),
    )
  );
}