import 'dart:convert';

import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../model/userInfo.dart';

import 'package:http/http.dart' as http;

Future<http.Response> getUserInfo() async {
  User user = await UserApi.instance.me();
  int userId = user.id;
  String url = 'http://localhost:8080/api/v1/user/$userId';
  final response = await http.get(Uri.parse(url));
  return response;
}

class UserInfoController extends GetxController{
  Rx<UserInfo> user = Rx<UserInfo>(UserInfo());

  @override
  void onReady() async {
    super.onReady();

    final userInfo = await getUserInfo();

    final jsonStr = jsonDecode(utf8.decode(userInfo.bodyBytes));
    print(jsonStr);

    // json 문자열을 UserInfo 객체로 변환
    if (jsonStr != null) {
      final userInfoObj = UserInfo.fromJson(jsonStr);
      user.value = userInfoObj;
    }
  }

  void changeNickname(String nickname){
    user.update((userInfo) {
        userInfo?.nickname?.value = nickname;
    });
  }

}