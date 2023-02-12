// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/basic_components/basictext.dart';
import 'package:ting_flutter/components/homeAppbar.dart';
import 'package:ting_flutter/named_routing/config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/screens/home/controller/MainButtonController.dart';
import 'package:ting_flutter/screens/home/controller/ProfileController.dart';

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
            // 캐러셀 슬라이더
            Flexible(
              flex: 130,
              fit: FlexFit.tight,
              child: Center(
                child: Container(
                  width: 410.w,
                  height: 103.h,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      height: 103.h,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                    items: [
                      Container(
                        child: Image.asset(
                          'assets/images/home/reminder.png',
                          width: 410.w,
                          height: 103.h,
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset:
                                  Offset(0, 0.5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 캐러셀 슬라이더

            Spacer(
              flex: 21,
            ),

            // 필터, 팀채팅 버튼
            Flexible(
              flex: 50,
              child: Row(
                children: [
                  Spacer(
                    flex: 34,
                  ),
                  Flexible(
                    flex: 50,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FilterViewRoute);
                        },
                        child: Image.asset('assets/images/home/filter.png')),
                  ),
                  Spacer(
                    flex: 289,
                  ),
                  Flexible(
                    flex: 40,
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/home/teamchat.png')),
                  ),
                  Spacer(
                    flex: 34,
                  ),
                ],
              ),
            ),
            // <= 필터, 팀채팅 버튼

            // => 필터, 팀채팅 텍스트
            Flexible(
              flex: 20,
              child: Row(
                children: [
                  Spacer(
                    flex: 50,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '필터',
                      fontSize: 12.0.w,
                    ),
                  ),
                  Spacer(
                    flex: 333,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '팀 채팅',
                      fontSize: 12.0.w,
                    ),
                  ),
                  Spacer(
                    flex: 13,
                  ),
                ],
              ),
            ),
            // <= 필터, 팀채팅 텍스트

            // => 자기 프로필
            Flexible(
              flex: 130,
              child: Center(
                child: HomeProfile(
                  isBoss: true,
                  num: 0,
                ),
              ),
            ),
            // <= 자기 프로필

            // => 선 두개
            Flexible(
              flex: 137,
              child: Center(
                child: Row(
                  children: [],
                ),
              ),
            ),
            // <= 선 두개

            // => 프로필 두개
            Flexible(
              flex: 130,
              child: Row(
                children: [
                  Spacer(
                    flex: 31,
                  ),
                  Flexible(
                    flex: 130,
                    child: Center(
                        child: HomeProfile(
                      isBoss: false,
                      num: 1,
                    )),
                  ),
                  Spacer(
                    flex: 137,
                  ),
                  Flexible(
                    flex: 130,
                    child: Center(
                        child: HomeProfile(
                      isBoss: false,
                      num: 2,
                    )),
                  ),
                  Spacer(
                    flex: 31,
                  ),
                ],
              ),
            ),
            // => 프로필 두개

            Spacer(
              flex: 44,
            ),
            // => 매칭버튼
            Flexible(
              flex: 120,
              child: Row(
                children: [
                  // 버튼
                  Spacer(
                    flex: 183,
                  ),

                  Flexible(
                    flex: 90,
                    child: Image.asset(
                      'assets/images/home/mainbutton.png',
                      width: 120.h,
                      height: 120.h,
                    ),
                  ),

                  // 버튼
                  Spacer(flex: 4,),
                  // => 말풍선
                  Flexible(
                    flex: 67,
                    child: TextBubble(),
                  ),

                  // <= 말풍선

                  Spacer(
                    flex: 112,
                  ),
                ],
              ),
            ),
            // <= 매칭버튼

            Spacer(
              flex: 60,
            )
          ],
        ));
  }
}

// =>프로필 위젯
class HomeProfile extends StatelessWidget {
  HomeProfile({required this.isBoss, required this.num});

  bool isBoss;
  int num;
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(builder: ((controller) {
      Color color;
      if (controller.isReady.elementAt(num) == true) {
        print(num);
        print(controller.isReady.elementAt(num));
        color = Color(0xffe0e2f3);
      } else {
        color = Color(0xffffffff);
      }
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 135.h,
            height: 135.h,
            child: Image.asset(
              controller.profileLinks.elementAt(num),
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 6.w,
                color: color,
              ),
              borderRadius: BorderRadius.circular(25.18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ), //
          ),
          Visibility(
            visible: isBoss,
            child: Positioned(
                top: -20.h,
                left: -9.w,
                child: Image.asset(
                  'assets/images/home/crown.png',
                  width: 35.w,
                  height: 35.h,
                )),
          ),
        ],
      );
    }));
  }
}
// <= 프로필 위젯

class Point {
  Point({required this.x, required this.y});

  double x;
  double y;
}

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height * 0.8);
    final tailSize = Size(size.width * 0.1, size.height - bubbleSize.height);
    final fillet = bubbleSize.width * 0.14;
    final tailStartPoint =
        Point(x: fillet / 5.0, y: bubbleSize.height - fillet * 4.0 / 5.0);
    //bubble body
    final bubblePath = Path()
      ..moveTo(0, fillet)
      // 왼쪽 위에서 왼쪽 아래 라인
      ..lineTo(0, bubbleSize.height - fillet)
      ..quadraticBezierTo(0, bubbleSize.height, fillet, bubbleSize.height)
      // 왼쪽 아래에서 오른쪽 아래 라인
      ..lineTo(bubbleSize.width - fillet, bubbleSize.height)
      ..quadraticBezierTo(bubbleSize.width, bubbleSize.height, bubbleSize.width,
          bubbleSize.height - fillet)
      // 오른쪽 아래에서 오른쪽 위 라인
      ..lineTo(bubbleSize.width, fillet)
      ..quadraticBezierTo(bubbleSize.width, 0, bubbleSize.width - fillet, 0)
      // 오른쪽 위에서 왼쪽 위 라인
      ..lineTo(fillet, 0)
      ..quadraticBezierTo(0, 0, 0, fillet);
    // bubble tail

    final myTailPath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..lineTo(-fillet / 3.0, bubbleSize.height + fillet / 3.0)
      ..lineTo(fillet * 4.0 / 5.0, bubbleSize.height - fillet / 5.0);

    // add tail to bubble body
    bubblePath.addPath(myTailPath, Offset(0, 0));
    // paint setting
    final paint = Paint()
      ..color = Color(0xffededed)
      ..style = PaintingStyle.fill;
    // draw
    canvas.drawPath(bubblePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class TextBubble extends StatelessWidget {
  
  final mainButtonController = Get.put(MainButtonController());
  @override
  Widget build(BuildContext context) {
    return GetX<MainButtonController>(builder: ((controller) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -1.h,
            child: Container(
              width: 65.w,
              height: 35.h,
              child: CustomPaint(
                painter: BubblePainter(),
              ),
            ),
          ),

          Positioned(
            top: 4.h,
            left: 11.h,
            child: basicText(text: controller.state.toString(), fontSize: 12.0.w,)
          ),
        ] 
      );
    }));
  }
}
