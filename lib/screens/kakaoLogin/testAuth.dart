import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:ting_flutter/components/myAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:ting_flutter/getX/controller/userInfoController.dart';

class TestSignUp extends StatefulWidget {
  const TestSignUp({Key? key}) : super(key: key);

  @override
  _TestSignUpState createState() => _TestSignUpState();
}

class _TestSignUpState extends State<TestSignUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    UserController userController = Get.find<UserController>();
    return Scaffold(
      appBar: baseAppBar("테스트페이지"),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("닉네임 변경");
                      },
                      child: Text("반응형 확인"),
                    ),
                    Text("UserController의 회원정보"),
                    Obx(() => Text("user의 회원ID: ${userController.userModel.value.userId}")),
                    Obx(() => Text("user의 닉네임: ${userController.userModel.value.nickname}")),
                    Obx(() => Text("user의 이미지 인덱스: ${userController.userModel.value.image}")),
                    Obx(() => Text("user의 전공계열: ${userController.userModel.value.major}")),
                    Obx(() => Text("user의 팀ID: ${userController.userModel.value.team.value.teamId}")),
                    Obx(() => Text("friend들의 닉네임: ${userController.userModel.value.friends.value.map((e) => e.nickname)}")),
                    Obx(() => Text("매칭중인가? ${userController.userModel.value.team.value.isMatching}")),
                    Obx(() => Text("user의 생일 : ${userController.userModel.value.birthday}")),
                    Obx(() => Text("user의 학번 : ${userController.userModel.value.schoolNum}")),
                    Obx(() => Text("user의 학교이름 : ${userController.userModel.value.schoolName}")),

                    ElevatedButton(
                      onPressed: () async {
                        try {
                          AccessTokenInfo tokenInfo =
                              await UserApi.instance.accessTokenInfo();
                          print('토큰 정보 보기 성공'
                              '\n회원정보: ${tokenInfo.id}'
                              '\n만료시간: ${tokenInfo.expiresIn} 초');
                        } catch (error) {
                          print('토큰 정보 보기 실패 $error');
                        }
                      },
                      child: Text("액세스토큰 정보보기"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          User user = await UserApi.instance.me();
                          await http.put(Uri.parse(
                              'http://localhost:8080/api/v1/user/test/${user.id}'));
                          await UserApi.instance.logout();
                          print('로그아웃 성공, SDK에서 토큰 삭제');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        } catch (error) {
                          print('로그아웃 실패, SDK에서 토큰 삭제 $error');
                        }
                      },
                      child: Text("로그아웃"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          print("TestAuth");
                          UserIdResponse userIdResponse =
                              await UserApi.instance.unlink();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                          print('연결 끊기 성공, SDK에서 토큰 삭제 ${userIdResponse}');
                        } catch (error) {
                          print('연결 끊기 실패 $error');
                        }
                      },
                      child: Text("연결끊기"),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
