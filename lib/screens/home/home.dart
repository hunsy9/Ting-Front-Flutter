// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/components/homeAppbar.dart';
import 'package:ting_flutter/named_routing/config.dart';

const String my_profile_image =
    'assets/images/—Pngtree—simple flat character avatar_6202775 1.png';
String second_profile_image = 'assets/images/plus-01.png';
String third_profile_image = 'assets/images/plus-01.png';
int second_profile_state = 2;
int third_profile_state = 2;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar("", context),
        body: Column(
          children: [
            TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, AdditionalAuthViewRoute);
                }),
                child: const Text('추가정보입력')),
            Container(
              width: 446.w,
              height: 1.h,
              color: Color(0xffBEBEBE),
            ),

            //
            SizedBox(
              height: 20.h,
            ),

            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                bigButton('assets/images/timer.png', 71, 71, context, 1),
                SizedBox(
                  width: 25.w,
                ),
                bigButton(
                    'assets/images/digital_marketing.png', 69, 69, context, 2),
                SizedBox(
                  width: 25.w,
                ),
                bigButton('assets/images/free-icon-user-profile-7487102 1.png',
                    52, 52, context, 3),
              ],
            ),
            SizedBox(
              height: 7.0.h,
            ),

            Row(
              children: [
                SizedBox(
                  width: 57.w,
                ),
                SizedBox(
                  width: 71.63.w,
                  height: 20.39.h,
                  child: Text(
                    '추천 장소',
                    style: TextStyle(
                        fontFamily: 'nanumsquareround', fontSize: 14.92),
                  ),
                ),
                SizedBox(
                  width: 67.37.w,
                ),
                SizedBox(
                  width: 71.63.w,
                  height: 20.39.h,
                  child: Text(
                    '공지사항',
                    style: TextStyle(
                        fontFamily: 'nanumsquareround', fontSize: 14.92),
                  ),
                ),
                SizedBox(
                  width: 62.37.w,
                ),
                SizedBox(
                  width: 71.63.w,
                  height: 20.39.h,
                  child: Text(
                    '내 프로필',
                    style: TextStyle(
                        fontFamily: 'nanumsquareround', fontSize: 14.92),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 37.61.h,
            ),

            Row(
              children: [
                SizedBox(
                  width: 316.w,
                ),
                ButtonTheme(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FilterViewRoute);
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/filter.png'),
                        Flexible(
                          child: SizedBox(
                            width: 71.63.w,
                            height: 20.39.h,
                            child: Text(
                              '필터 적용',
                              style: TextStyle(
                                fontFamily: 'nanumsquareround',
                                fontSize: 13.92,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffD9D9D9)),
                      fixedSize:
                          MaterialStateProperty.all(Size(99.98.w, 30.59.h)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.38))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36.41.h,
            ),

            profile_circle(my_profile_image, 1, context),
            SizedBox(
              height: 91.18.h,
            ),

            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                      child: profile_circle(
                          second_profile_image, second_profile_state, context),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: profile_circle(
                          third_profile_image, third_profile_state, context),
                    )),
              ],
            ),

            SizedBox(height: 108.16.h),

            TextButton(
              onPressed: () {},
              child: Text(
                '매칭 신청하기',
                style: TextStyle(
                    fontFamily: 'nanumsquareround',
                    fontSize: 15,
                    color: Color(0xffffffff)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff6b42c5)),
                fixedSize: MaterialStateProperty.all(Size(392.w, 72.h)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ));
  }
}

// 추천 장소, 공지사항, 내 프로필 버튼 //
ButtonTheme bigButton(
    String image, double width, double height, context, int index) {
  //임시방편 인덱스넣어둠

  return ButtonTheme(
    child: TextButton(
      onPressed: () {
        switch (index) {
          case 1:
            Navigator.pushNamed(context, RecommendedPlaceViewRoute);
            break;
          case 2:
            Navigator.pushNamed(context, NoticeViewRoute);
            break;
          case 3:
            Navigator.pushNamed(context, TestAuthViewRoute);
        }
      },
      child: Image.asset(
        image,
        width: width.w,
        height: height.h,
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color(0xffe1def4).withOpacity(0.38)),
        fixedSize: MaterialStateProperty.all(Size(112.w, 93.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          )),
        ),
      ),
    ),
  );
}

//  종, 공유, 설정 버튼 //
ButtonTheme smallButton(String image, double width, double height, context) {
  return ButtonTheme(
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/alarm");
      },
      child: Image.asset(
        image,
        width: width.w,
        height: height.h,
      ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  );
}

Stack profile_circle(String image, int type, BuildContext context) {
  double width, height, top, left;
  Color color;
  if (type == 1) {
    width = 79.w;
    height = 68.h;
    top = 28.h;
    left = 12.67.w;
    color = Color(0xfff4f2fb);
  } else {
    width = 29.18.w;
    height = 29.18.h;
    top = 37.69.h;
    left = 37.69.w;
    color = Color(0xffffffff);
  }

  return Stack(
    children: [
      Container(
        width: 103.33.w,
        height: 103.33.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          shape: BoxShape.circle,
          color: Color(0xffd9d9d9),
        ),
      ),
      Positioned(
        top: 9.73.h,
        left: 8.51.w,
        child: Container(
          width: 86.31.w,
          height: 86.31.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
      Positioned(
        top: top,
        left: left,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: TextButton(
            onPressed: () {},
            child: Image.asset(
              image,
              width: width,
              height: height,
            ),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      )
    ],
  );
}

Future<void> requestNew() async {
  //for test
  await Future.delayed(Duration(milliseconds: 1000));
  //refresh contents
}
