import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 250.h,),
                    Center(
                        child: Image.asset('assets/images/Ting_Login_Logo.png',height: 180.h,)
                    ),
                    SizedBox(height: 250.h,),
                    GestureDetector(

                      onTap:() async{

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
                            Navigator.pushNamed(context, '/home');
                            User user = await UserApi.instance.me();
                            print(
                                      '\n회원번호: ${user.id}'
                                      '\n이메일: ${user.kakaoAccount?.email}'
                                      '\n성별: ${user.kakaoAccount?.gender}'
                                      '\n연령대: ${user.kakaoAccount?.ageRange}'
                                          '\n토큰 존재 여부: ${AuthApi.instance.hasToken().toString()}'
                                  );
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
                      },
                      child: Container(
                        height: 200.h,
                        width: 300.w,
                        child: Image.asset('assets/xhdpi/kakao_login_large_wide.png',height: 180.h,),),
                    )

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}