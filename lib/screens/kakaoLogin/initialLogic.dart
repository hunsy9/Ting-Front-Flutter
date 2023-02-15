import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import '../../named_routing/config.dart';

void getUserInfo() async {
  print("getUserInfo");

}

void getUserFriends() async {
  print("getUserFriends");
}

void initialize(context) async{
  try{
    await UserApi.instance.accessTokenInfo();
  } catch (error) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });
    return;
  }
  Future.delayed(const Duration(seconds: 3), () async {
    Navigator.pushNamed(context, NavigatorViewRoute);
  });
}
