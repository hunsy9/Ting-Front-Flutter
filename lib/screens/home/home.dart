// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:typed_data';
import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:ting_flutter/basic_components/basictext.dart';
import 'package:ting_flutter/components/homeAppbar.dart';
import 'package:ting_flutter/getX/controller/userInfoController.dart';
import 'package:ting_flutter/named_routing/config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/screens/home/controller/MainButtonController.dart';
import 'package:ting_flutter/screens/home/controller/ProfileController.dart';
import 'package:ting_flutter/getX/model/userInfo.dart';

enum MatchState { success, fail, none }

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
        backgroundColor: Colors.white,
        appBar: homeAppBar("", context),
        body: Column(
          children: [
            // 캐러셀 슬라이더
            Flexible(
              flex: 103,
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
              flex: 17,
            ),

            // 필터, 팀채팅 버튼
            Flexible(
              flex: 55,
              child: Row(
                children: [
                  Spacer(
                    flex: 27,
                  ),
                  Flexible(
                    flex: 50,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FilterViewRoute);
                        },
                        child: Image.asset('assets/images/home/filter.png', width: 50.w, height: 50.w)),
                  ),
                  Spacer(
                    flex: 289,
                  ),
                  Flexible(
                    flex: 40,
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/home/teamchat.png', width: 40.w, height: 40.w)),
                  ),
                  Spacer(
                    flex: 30,
                  ),
                ],
              ),
            ),
            // <= 필터, 팀채팅 버튼

            // => 필터, 팀채팅 텍스트
            Flexible(
              flex: 14,
              child: Row(
                children: [
                  Spacer(
                    flex: 47,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '필터',
                      fontSize: 12.0.h,
                    ),
                  ),
                  Spacer(
                    flex: 350,
                  ),
                  Flexible(
                    flex: 50,
                    child: basicText(
                      text: '팀 채팅',
                      fontSize: 12.0.h,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
            // <= 필터, 팀채팅 텍스트

            Spacer(flex: 11,),
            // => 자기 프로필
            Obx(() {

              UserController userController = Get.put(UserController());
              print("리더아이디: ${userController.userModel.value.team.value.leaderId}");
              print("유저아이디 :${userController.userModel.value.userId}",);
              bool isBoss =  
                            userController.userModel.value.userId == userController.userModel.value.team.value.leaderId;
              String myImage = userController.userModel.value.image ?? '0';
              return Flexible(
              flex: 130,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    
                    if (true) {
                      showDialog(
                        context: context,
                        builder: (context,) {
                          String nickName = userController.userModel.value.nickname!;
                          String schoolName = userController.userModel.value.schoolName!;
                          String majorField = userController.userModel.value.major!;
                          String birthYear = userController.userModel.value.birthday!;
                          String enterYear = userController.userModel.value.schoolNum!;

                          return DetailedProfile(imageLink: 'assets/profile/${myImage}.png', 
                            nickName: nickName, 
                            introduction: "", 
                            school: schoolName, 
                            majorField: majorField, 
                            birthYear: birthYear, 
                            enterYear: enterYear,
                          );
                        }
                      );
                    } 
                  },
                  child: HomeProfile(
                    imageNumber: myImage,
                    isBoss: isBoss,
                    num: 0,
                  ),
                ),
              ),
            );
            }),
            // <= 자기 프로필

            Spacer(flex: 5,),
            // => 선 두개
            Flexible(
              flex: 1,
              child: Center(
                child: Row(
                  children: [
                    Spacer(flex: 216,),

                    Flexible(
                      flex:30,
                      child: Transform.rotate(
                        angle: 30 * pi / 180,
                        child: FriendLine(start: Point(x:220.w , y:400.h), end: Point(x:150.w, y:540.h))
                      )
                    ),

                    Spacer(flex: 70,),

                    Flexible(
                      flex:70,
                      child: Transform.rotate(
                        angle: 330 * pi / 180,
                        child: FriendLine(start: Point(x:220.w , y:400.h), end: Point(x:150.w, y:540.h))
                      )
                    ),

                    Spacer(flex: 114,),
                  ],
                ),
              ),
            ),
            // <= 선 두개

            Spacer(flex: 130,),

            // => 프로필 두개
            Obx(() {
              UserController userController = Get.put(UserController());
              bool leftIsBoss = false;
              String leftFriend ='';
              String rightFriend='';
              String leftImage ='7';
              String rightImage ='7';

              int? member1Id = userController.userModel.value.team.value.member1Id;
              int? member2Id = userController.userModel.value.team.value.member2Id;

              print(member1Id);
              print(member2Id);

              for (FriendModel friendModel in userController.userModel.value.friends) {
                if (friendModel.userId == member1Id) {
                  leftFriend = friendModel.nickname ?? '';
                } else if (friendModel.userId == member2Id) {
                  rightFriend = friendModel.nickname ?? '';
                }
              }


              // if (userController.userModel.value.team != null) {
              //   if(userController.userModel.value.team.value.leaderNickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.member1Nickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member2Nickname ?? '';
              //     leftIsBoss = false;
              //   } else if (userController.userModel.value.team.value.member1Nickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.leaderNickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member2Nickname ?? '';
              //   } else if (userController.userModel.value.team.value.member2Nickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.leaderNickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member1Nickname ?? '';
              //   }
              // }
              FriendModel? friendModel1;
              for (FriendModel friendModel3 in userController.userModel.value.friends) {
                if (friendModel3.nickname == leftFriend) {
                  friendModel1 = friendModel3;
                  leftImage = friendModel1.image ?? '7';
                  break;
                }
              }

              FriendModel? friendModel2;
              for (FriendModel friendModel3 in userController.userModel.value.friends) {
                if (friendModel3.nickname == rightFriend) {
                  friendModel2 = friendModel3;
                  rightImage = friendModel2.image ?? '7';
                  break;
                }
              }

              return Flexible(
                flex: 130,
                child: Row(
                  children: [
                    Spacer(
                      flex: 31,
                    ),
                    Flexible(
                      flex: 130,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            
                            if (leftFriend != '') {
                              showDialog(
                                context: context,
                                builder: (context,) {
                                  
                                  String nickName = friendModel1!.nickname!;
                                  String schoolName= userController.userModel.value.schoolName!;
                                  String majorField = friendModel1.major!;
                                  int birthYear = friendModel1.age!;
                                  String enterYear = friendModel1.schoolNum!;

                                  return DetailedProfile(imageLink: 'assets/profile/${friendModel1.image}.png', 
                                    nickName: nickName, 
                                    introduction: "", 
                                    school: schoolName, 
                                    majorField: majorField, 
                                    birthYear: birthYear.toString(), 
                                    enterYear: enterYear,
                                  );
                                }
                              );
                            }
                            
                            
                          },
                          child: HomeProfile(
                            imageNumber: leftImage,
                            isBoss: leftIsBoss,
                            num: 1,
                          ),
                        ),
                      ),
                    ),

                    Spacer(
                      flex: 137,
                    ),
                    Flexible(
                      flex: 130,
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          
                          if (rightFriend != '') {
                            showDialog(
                                context: context,
                                builder: (context,) {
                                  String nickName = friendModel2!.nickname!;
                                  String schoolName = userController.userModel.value.schoolName!;
                                  String majorField = friendModel2.major!;
                                  int birthYear = friendModel2.age!;
                                  String enterYear = friendModel2.schoolNum!;

                                  return DetailedProfile(imageLink: 'assets/profile/${friendModel2.image}.png', 
                                    nickName: nickName, 
                                    introduction: "", 
                                    school: schoolName, 
                                    majorField: majorField, 
                                    birthYear: birthYear.toString(), 
                                    enterYear: enterYear,
                                  );
                                }
                            );
                          }
                          
                        },
                        child: HomeProfile(
                          imageNumber: rightImage,
                          isBoss: false,
                          num: 2,
                        ),
                      )),
                    ),
                    Spacer(
                      flex: 31,
                    ),
                  ],
                ),
              );
            }),
            // => 프로필 두개

            Spacer(
              flex: 6,
            ),




            // 프로필 텍스트 두개 //
            Obx(() {
              UserController userController = Get.put(UserController());
              bool leftIsBoss = false;
              String leftFriend ='';
              String rightFriend=''; 
              String leftImage ='';
              String rightImage ='';

              int? member1Id = userController.userModel.value.team.value.member1Id;
              int? member2Id = userController.userModel.value.team.value.member2Id;

              for (FriendModel friendModel in userController.userModel.value.friends) {
                if (friendModel.userId == member1Id) {
                  leftFriend = friendModel.nickname ?? '';
                } else if (friendModel.userId == member2Id) {
                  rightFriend = friendModel.nickname ?? '';
                }
              }


              // if (userController.userModel.value.team != null) {
              //   if(userController.userModel.value.team.value.leaderNickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.member1Nickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member2Nickname ?? '';
              //     leftIsBoss = false;
              //   } else if (userController.userModel.value.team.value.member1Nickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.leaderNickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member2Nickname ?? '';
              //   } else if (userController.userModel.value.team.value.member2Nickname == userController.userModel.value.nickname) {
              //     leftFriend = userController.userModel.value.team.value.leaderNickname ?? '';
              //     rightFriend = userController.userModel.value.team.value.member1Nickname ?? '';
              //   }
              // }
              FriendModel? friendModel1;
              for (FriendModel friendModel3 in userController.userModel.value.friends) {
                if (friendModel3.nickname == leftFriend) {
                  friendModel1 = friendModel3;
                  leftImage = friendModel1.image ?? '7';
                  break;
                }
              }

              FriendModel? friendModel2;
              for (FriendModel friendModel3 in userController.userModel.value.friends) {
                if (friendModel3.nickname == rightFriend) {
                  friendModel2 = friendModel3;
                  rightImage = friendModel2.image ?? '7';
                  break;   
                }
              }
              
              return Flexible(
                flex: 20, 
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 31,),

                    Flexible(
                      flex:126, 
                      child: Container(
                        width: 126.w,
                        height: 20.h,
                        child: Center(
                          child: basicText(
                            text: leftFriend,
                            fontSize: 14.h,
                          ),
                        ),
                      ),
                    ),
                    

                    Spacer(flex: 137,),

                    Flexible(
                      flex:126, 
                      child: Container(
                        width: 126.w,
                        height: 20.h,
                        child: Center(
                          child: basicText(
                            text: rightFriend,
                            fontSize: 14.h,
                          ),
                        ),
                      ),
                    ),
                   
                    Spacer(flex: 31,),
                  ],
                )
              );
            }),


            Spacer(
              flex: 13,
            ),


            // => 매칭버튼
            Flexible(
              flex: 120,
              child: Row(
                children: [
                  // 버튼
                  Spacer(
                    flex: 181,
                  ),

                  Flexible(
                    flex: 90,
                    child: Image.asset(
                      'assets/images/home/mainbutton.png',
                      width: 80.w,
                      height: 80.w,
                    ),
                  ),

                  // 버튼
                  Spacer(
                    flex: 4,
                  ),
                  // => 말풍선
                  Flexible(
                    flex: 53,
                    child: TextBubble(),
                  ),

                  // <= 말풍선

                  Spacer(
                    flex: 110,
                  ),
                ],
              ),
            ),
            // <= 매칭버튼

            Spacer(
              flex: 41,
            ),

            GestureDetector(onTap: () { showDialog(context: context, builder: (context,) {
                return Center(child: successModal());
              });
            },child: basicText(text: '모달 실험'))

          ],
        ));
  }
}















// =>프로필 위젯
class HomeProfile extends StatelessWidget {
  HomeProfile({required this.isBoss, required this.num, required this.imageNumber});

  bool isBoss;
  int num;
  String imageNumber;
  @override
  Widget build(BuildContext context) {
      Color color = Color(0xffffffff);
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 125.89.h,
            height: 125.89.h,
            child: Image.asset(
              'assets/profile/${imageNumber}.png', width: 60.h, height: 60.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
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
  }
}

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

class LinePainter extends CustomPainter {

  LinePainter({required this.start, required this.end});
  Point start;
  Point end;


  @override
  void paint(Canvas canvas, Size size) {
    double length = sqrt((start.x-end.x)*(start.x-end.x) + (start.y-end.y)*(start.y-end.y));
    double horizontal = 2.w;
    double vertical = 2.h;
    int standard = 22;
    
    //bubble body
    final bubblePath = Path()
      ..quadraticBezierTo(-horizontal, 0, -horizontal, vertical)
      ..lineTo(-horizontal, vertical+length/standard)
      ..quadraticBezierTo(-horizontal, vertical+length/standard+vertical, 0, vertical+length/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length/standard+vertical, horizontal, vertical+length/standard)
      ..lineTo(horizontal, vertical)
      ..quadraticBezierTo(horizontal, 0, 0, 0)
      // 왼쪽 위
      ..moveTo(0, length*2.5/standard)
      ..quadraticBezierTo(-horizontal, length*2.5/standard, -horizontal, vertical+length*2.5/standard)
      ..lineTo(-horizontal, vertical+length*4.0/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*4.0/standard+vertical, 0, vertical+length*4.0/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*4.0/standard+vertical, horizontal, vertical+length*4.0/standard)
      ..lineTo(horizontal, vertical+length*2.5/standard)
      ..quadraticBezierTo(horizontal, length*2.5/standard, 0, length*2.5/standard)
      // 왼쪽 위
      ..moveTo(0, length*5.5/standard)
      ..quadraticBezierTo(-horizontal, length*5.5/standard, -horizontal, vertical+length*5.5/standard)
      ..lineTo(-horizontal, vertical+length*7.0/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*7.0/standard+vertical, 0, vertical+length*7.0/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*7.0/standard+vertical, horizontal, vertical+length*7.0/standard)
      ..lineTo(horizontal, vertical+length*5.5/standard)
      ..quadraticBezierTo(horizontal, length*5.5/standard, 0, length*5.5/standard)
      // 왼쪽 위
      ..moveTo(0, length*8.5/standard)
      ..quadraticBezierTo(-horizontal, length*8.5/standard, -horizontal, vertical+length*8.5/standard)
      ..lineTo(-horizontal, vertical+length*10.0/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*10.0/standard+vertical, 0, vertical+length*10.0/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*10.0/standard+vertical, horizontal, vertical+length*10.0/standard)
      ..lineTo(horizontal, vertical+length*8.5/standard)
      ..quadraticBezierTo(horizontal, length*8.5/standard, 0, length*8.5/standard)
      // 왼쪽 위
      ..moveTo(0, length*11.5/standard)
      ..quadraticBezierTo(-horizontal, length*11.5/standard, -horizontal, vertical+length*11.5/standard)
      ..lineTo(-horizontal, vertical+length*13.0/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*13.0/standard+vertical, 0, vertical+length*13.0/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*13.0/standard+vertical, horizontal, vertical+length*13.0/standard)
      ..lineTo(horizontal, vertical+length*11.5/standard)
      ..quadraticBezierTo(horizontal, length*11.5/standard, 0, length*11.5/standard)
      // 왼쪽 위
      ..moveTo(0, length*14.5/standard)
      ..quadraticBezierTo(-horizontal, length*14.5/standard, -horizontal, vertical+length*14.5/standard)
      ..lineTo(-horizontal, vertical+length*16.0/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*16.0/standard+vertical, 0, vertical+length*16.0/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*16.0/standard+vertical, horizontal, vertical+length*16.0/standard)
      ..lineTo(horizontal, vertical+length*14.5/standard)
      ..quadraticBezierTo(horizontal, length*14.5/standard, 0, length*14.5/standard)
       // 왼쪽 위
      ..moveTo(0, length*17.5/standard)
      ..quadraticBezierTo(-horizontal, length*17.5/standard, -horizontal, vertical+length*17.5/standard)
      ..lineTo(-horizontal, vertical+length*18.5/standard)
      ..quadraticBezierTo(-horizontal, vertical+length*18.5/standard+vertical, 0, vertical+length*18.5/standard+vertical)
      ..quadraticBezierTo(horizontal, vertical+length*18.5/standard+vertical, horizontal, vertical+length*18.5/standard)
      ..lineTo(horizontal, vertical+length*17.5/standard)
      ..quadraticBezierTo(horizontal, length*17.5/standard, 0, length*17.5/standard);
      
      



    // paint setting
    final paint = Paint()
      ..color = Color(0xff272238)
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

class FriendLine extends StatelessWidget {

  FriendLine({required this.start, required this.end});
  Point start;
  Point end;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter:LinePainter(start: start, end: end)
    );
  }


}



class TextBubble extends StatelessWidget {
  final mainButtonController = Get.put(MainButtonController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UserController userController = Get.put(UserController());
      List<String> matchingState = ['매칭 시작', '매칭 중...', '매칭 완료', '매칭 실패'];
      return Stack(clipBehavior: Clip.none, children: [
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
            top: 6.6.h,
            left: 9.8.h,
            child: basicText(
              text: matchingState.elementAt(1),
              fontSize: 12.0.w,
            )),
      ]);
    },);
  }
}

class DetailedProfile extends StatelessWidget {
  DetailedProfile({
    required this.imageLink,
    required this.nickName,
    required this.introduction,
    required this.school,
    required this.majorField,
    required this.birthYear,
    required this.enterYear,
  });

  String imageLink;
  String nickName;
  String introduction;
  String school;
  String majorField;
  String birthYear;
  String enterYear;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 385.w,
            height: 523.h,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),

          // 사진
          Positioned(
            top: -26.h,
            left: 35.w,
            child: Container(
              width: 228.h,
              height: 228.h,
              child: Image.asset(
                imageLink,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 6.0.w, color: Color(0xfffffff)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          // 프로필 사진

          // 닉네임
          Positioned(
            top: 237.h,
            left: 49.w,
            child: Text(
              nickName,
              style: TextStyle(
                fontFamily: 'nanumsquareround',
                fontSize: 30.w,
                fontWeight: FontWeight.w800,
                color: Color(0xff978e9b),
              ),
              textAlign: TextAlign.start,
            ),
          ),

          // 년생, 학번
          Positioned(
            top: 249.h,
            left: 200.w,
            child: Text(
              "${birthYear}년생 | ${enterYear}학번",
              style: TextStyle(
                fontFamily: 'nanumsquareround',
                fontSize: 15.w,
                fontWeight: FontWeight.w800,
                color: Color(0xff655c69),
              ),
              textAlign: TextAlign.start,
            ),
          ),

          // 한줄소개
          Positioned(
            top: 295.h,
            left: 55.w,
            child: Text(
              introduction,
              style: TextStyle(
                fontFamily: 'nanumsquareround',
                fontSize: 15.w,
                fontWeight: FontWeight.w800,
                color: Color(0xff978e9b),
              ),
              textAlign: TextAlign.start,
            ),
          ),

          // 대학 로고
          Positioned(
            top: 325.h,
            left: 49.w,
            child: Image.asset(
              'assets/images/home/crown.png',
              width: 54.h,
              height: 54.h,
            ),
          ),

          // 대학명
          Positioned(
            top: 338.h,
            left: 110.w,
            child: Text(
              school,
              style: TextStyle(
                fontFamily: 'nanumsquareround',
                fontSize: 21.w,
                fontWeight: FontWeight.w800,
                color: Color(0xff655c69),
              ),
            ),
          ),

          // 계열 배지
          Positioned(
            top: 409.h,
            left: 49.w,
            child: Image.asset(
              'assets/images/home/crown.png',
              width: 54.h,
              height: 54.h,
            ),
          ),

          // 계열 명
          Positioned(
            top: 422.h,
            left: 110.w,
            child: Text(
              majorField,
              style: TextStyle(
                fontFamily: 'nanumsquareround',
                fontSize: 21.w,
                fontWeight: FontWeight.w800,
                color: Color(0xff655c69),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class successModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385.w,
      height: 349.h,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.25),
            spreadRadius: 0.3,
            blurRadius: 20.0,
            offset: Offset(0, 13),
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2,),

          Flexible(
            flex: 40,
            child: Row(
              children: [
                Spacer(flex: 240,),
                Flexible(flex:40, child: GestureDetector(
                  onTap:() {
                    Navigator.of(context).pop(context);
                  },
                  child: Image.asset('assets/modal/close.png', width: 40.h, height: 40.h,))
                ),
              ],
            )
          ),

          Spacer(flex: 20,),

          Flexible(
            flex: 89,
            child: Row(
              children: [
                Spacer(flex: 50,),
                Flexible(flex:50, child: Image.asset('assets/modal/congratulation.png', width: 89.h, height: 89.h,)),
                Spacer(flex: 22,),
              ],
            )
          ),

          Spacer(flex: 55,),

          Flexible( 
            flex:25,
            child: basicText(text: '매칭이 성공했어요 !', fontSize: 20.h,)
          ),

          Spacer(flex: 25,),

          Flexible(
            flex:25,
            child: basicText(text: '상대방과 채팅을 해보세요 !', fontSize: 20.h,)
          ),

          Spacer(flex: 45,)
        ]
      ),
    );
  }
}