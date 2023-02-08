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
                    flex: 56,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '필터',
                      fontSize: 11.0,
                    ),
                  ),
                  Spacer(
                    flex: 355,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '팀 채팅',
                      fontSize: 11.0,
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
                  children: [
                    
                  ],
                ),
              ),
            ),
            // <= 선 두개

            // => 프로필 두개
            Flexible(
              flex: 130,
              child: Row(
                children: [
                  Spacer(flex: 31,),

                  Flexible(flex:130, child: HomeProfile(isBoss: false, num: 1,),),

                  Spacer(flex: 137,),

                  Flexible(flex:130, child: HomeProfile(isBoss: false, num: 2,),),

                  Spacer(flex: 31,),

                ],
              ),
            ),
            // => 프로필 두개


            Spacer(
              flex: 223,
            )
          ],
        ));
  }
}

// 프로필 위젯

class HomeProfile extends StatefulWidget {
  HomeProfile({required this.isBoss, required this.num});

  bool isBoss;
  int num;
  @override
  State<StatefulWidget> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 125.89.w,
          height: 125.89.w,
          child: GetX<ProfileController>(
            builder: (controller) { 
              return Image.asset(
                controller.profileLinks.elementAt(widget.num),
                fit: BoxFit.fill,
              );
            }
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 6.w,
              color: Colors.white,
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
      ],
    );
  }
}
