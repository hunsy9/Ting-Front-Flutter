import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:ting_flutter/named_routing/config.dart';

Future<http.Response> isSignedUp(String userId) async {
  String url =
      'http://localhost:8080/api/v1/kakaoAuth/isSignedUp?userId=$userId';
  final response = await http.get(Uri.parse(url));
  return response;
}

void kakaoLogic(context) async {
  {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공 ${token.accessToken}');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

// 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
// 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
// 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공 ${token.accessToken}');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공 ${token.accessToken}');

        User user = await UserApi.instance.me();
        http.Response response = await isSignedUp(user.id.toString());
        (response.body == "true")
            ? Navigator.pushNamed(context, NavigatorViewRoute)
            : Navigator.pushNamed(context, AdditionalAuthViewRoute);
        print('\n회원번호: ${user.id}'
            '\n이메일: ${user.kakaoAccount?.email}'
            '\n성별: ${user.kakaoAccount?.gender}'
            '\n연령대: ${user.kakaoAccount?.ageRange}'
            '\n토큰 존재 여부: ${AuthApi.instance.hasToken().toString()}');
// try {
//   User user = await UserApi.instance.me();
//   List<String> scopes = [];
//
//   if (user.kakaoAccount?.emailNeedsAgreement == true) {
//     scopes.add('account_email');
//   }
//   try {
//     token = await UserApi.instance.loginWithNewScopes(scopes);
//     print('현재 사용자가 동의한 동의 항목: ${token.scopes}');
//   } catch (error) {
//     print('추가 동의 요청 실패 $error');
//     return;
//   }
//
//   print('사용자 정보 요청 성공${user}'
//       '\n회원번호: ${user.id}'
//       '\n이메일: ${user.kakaoAccount?.email}'
//       '\n성별: ${user.kakaoAccount?.gender}'
//   );
// } catch (error) {
//   print('사용자 정보 요청 실패 $error');
// }
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }
}
