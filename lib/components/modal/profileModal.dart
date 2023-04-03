import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/getX/model/userInfo.dart';

import '../../../getX/controller/userInfoController.dart';

Widget ProfileModal(BuildContext context , bool isFriends, bool isMatchingPeople , int? userId) {

  UserController userController = Get.find<UserController>();

  String? imageIndex = '';
  String? nickName = '';
  String? birthday = '';
  String? schoolNum = '';
  String? univ = '';
  String? major = '';

  try{
    if(isFriends){
      Set<FriendModel> targetFriend = userController.friends.value.where((e) => e.userId == userId).toSet();
      imageIndex = targetFriend.first.image;
      nickName = targetFriend.first.nickname;
      birthday = targetFriend.first.birthday;
      schoolNum = targetFriend.first.schoolNum;
      univ = "부산대학교";
      major = targetFriend.first.major;

    }
    else if(isMatchingPeople){
      Set<MatchModel> targetMatchModel = userController.userModel.value.matches.value.where((e) => e.userId == userId).toSet();
      imageIndex = targetMatchModel.first.image;
      nickName = targetMatchModel.first.nickname;
      // birthday = targetMatchModel.birthday;
      birthday = "테스트";
      schoolNum = targetMatchModel.first.schoolNum;
      univ = "부산대학교";
      major = targetMatchModel.first.major;
    }
    else{
      imageIndex = userController.userModel.value.image;
      nickName = userController.userModel.value.nickname;
      birthday = userController.userModel.value.birthday;
      schoolNum = userController.userModel.value.schoolNum;
      univ = userController.userModel.value.schoolName;
      major = userController.userModel.value.major;
    }
  }catch(e){
    Navigator.pop(context);
  }





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
              'assets/profile/$imageIndex.png',
              height: 30.h,
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
            "$nickName",
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
            "$birthday년생 | $schoolNum학번",
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
            "한줄 소개입니다.",
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
            "$univ",
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
            "$major",
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
