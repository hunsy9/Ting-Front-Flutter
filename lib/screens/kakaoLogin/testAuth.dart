import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

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
                    SizedBox(height: 500.h,),
                    ElevatedButton(onPressed: ()async{
                      try {
                        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
                        print('토큰 정보 보기 성공'
                            '\n회원정보: ${tokenInfo.id}'
                            '\n만료시간: ${tokenInfo.expiresIn} 초');
                      } catch (error) {
                        print('토큰 정보 보기 실패 $error');
                      }
                    }, child: Text("액세스토큰 정보보기"),),
                    ElevatedButton(onPressed: ()async{
                      try {
                        await UserApi.instance.logout();
                        print('로그아웃 성공, SDK에서 토큰 삭제');
                        Navigator.pop(context);
                      } catch (error) {
                        print('로그아웃 실패, SDK에서 토큰 삭제 $error');
                      }
                    }, child: Text("로그아웃"),),
                    ElevatedButton(onPressed: ()async{
                      try {
                        UserIdResponse userIdResponse=await UserApi.instance.unlink();
                        Navigator.pop(context);
                        print('연결 끊기 성공, SDK에서 토큰 삭제 ${userIdResponse}');
                      } catch (error) {
                        print('연결 끊기 실패 $error');
                      }
                    }, child: Text("연결끊기"),),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}