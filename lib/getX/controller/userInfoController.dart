import 'dart:convert';

import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../model/userInfo.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  RxList<FriendModel> friends = <FriendModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    User user = await UserApi.instance.me();
    int userId = user.id;
    final response = await http.get(Uri.parse('http://localhost:8080/api/v1/user/1111'));
    if (response.body == null) {
      throw Exception('Failed to load user data');
    }
    final utf8decodedBody = utf8.decode(response.bodyBytes);
    final data = jsonDecode(utf8decodedBody);
    userModel.value = UserModel.fromJson(data['userDto']);
    userModel.value.friends = List<FriendModel>.from(data['friends'].map((friends) => FriendModel.fromJson(friends))).obs;
    userModel.value.team = TeamModel.fromJson(data['team']).obs;
    userModel.value.matches = List<MatchModel>.from(data['match'].map((matchModel) => MatchModel.fromJson(matchModel))).obs;
  }

  void updateUserNickName(String newNickName) {
    // userModel.value에 저장된 값 중 하나를 변경
    userModel.value.nickname = newNickName;
  }
}