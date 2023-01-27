import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/screens/kakaoLogin/additionalAuth/components/basicbutton.dart';
import 'package:ting_flutter/screens/kakaoLogin/additionalAuth/components/NanumFont.dart';
import 'components/SchoolInfoAndFetch.dart';
import 'components/textValidCheck.dart';
import 'package:lottie/lottie.dart';

// 추가정보 클래스
class AdditionalAuthScreen extends StatefulWidget {
  const AdditionalAuthScreen({Key? key}) : super(key: key);

  @override
  _AdditionalAuthScreenState createState() => _AdditionalAuthScreenState();
}

class _AdditionalAuthScreenState extends State<AdditionalAuthScreen> {
  @override
  void initState() {
    super.initState();
    getSchoolInfo();
    setState(() {
      department = _departmentList[0];
      schoolClass = _schoolClassList[0];
    });
  }

  late List<SchoolInfo> schoolList; // 처음 시작할 때 학교 정보들 다 받아서 저장
  List<SchoolInfo> schoolSuggestion = [];

  final nickNameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final univEmailController = TextEditingController();
  final emailValidController = TextEditingController();

  late bool nickNameValid = false;
  late Row nickNameUnderMessage = Row();
  bool emailValid = false;

  final _departmentList = [
    '경영/경제',
    '인문/사회',
    '공학',
    '자연과학',
    '교육',
    '의료',
    '예체능',
    '기타'
  ];

  final _schoolClassList = [
    23,
    22,
    21,
    20,
    19,
    18,
    17,
    16,
    15,
    14,
    13,
    12,
    11,
    10
  ];

  // visibility 세팅
  bool nickNameVisible = true; // 1번: 닉네임 입력
  bool univVisible = false; // 2번: 대학교 선택버튼
  bool univSearchVisible = false; // 3번: 대학교 선택
  bool univEmailVisible = false; // 4번: 대학교 이메일 입력
  bool emailValidVisible = false; // 5번: 학교 이메일 인증
  bool departmentVisible = false; // 6번: 학과, 학번 선택
  bool welcomeVisible = false; // 7번: 환영문구& 홈화면 가기

  // user 정보
  String nickName = "";
  String university = "";
  String univEmail = "";
  String univDomain = "";
  String department = "";
  int schoolClass = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(45.0.w, 169.h, 45.0.w, 51.0.h),
            child: Column(
              children: [
                // 닉네임 페이지
                nickNamePage(),
                // 대학교 선택 페이지
                // selectUniversityButtonPage(),
                // 대학교 선택 페이지
                searchUniversityPage(),
                // 대학교 이메일 인증 페이지
                inputEmailPage(),
                // 대학교 이메일 인증 확인 페이지
                checkEmailValidationPage(),
                // 학과, 학번 선택 페이지
                departmentPage(),
                // 가입 환영 페이지
                welcomePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getSchoolInfo() async {
    schoolList = await fetchSchoolInfo();
  }

  void getSchoolSuggestion(String input) {
    schoolSuggestion =
        schoolList.where((element) => (element.name.contains(input))).toList();
  }

  Widget nickNamePage() {
    return Visibility(
      visible: nickNameVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '닉네임을 입력해주세요.',
            style: nanumFontBold(23.0),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 30.0.h,
          ),
          SizedBox(
            width: 362.w,
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(),
                hintText: '홍길동',
              ),
              style: nanumFontNormal(24.0),
              cursorHeight: 23,
              controller: nickNameController,
              onSubmitted: (value) {
                setState(() {
                  if (nickNameValid) {
                    nickName = nickNameController.text;
                    nickNameValid = false;

                    nickNameVisible = false;
                    univSearchVisible = true;
                  }
                });
              },
              onChanged: (value) {
                setState(() {
                  Map<String, dynamic> currentNickName = nickNameCheck(value);
                  nickNameValid = currentNickName['validation'];
                  nickNameUnderMessage = currentNickName['helpMessage'];
                });
              },
            ),
          ),
          SizedBox(
            height: 30.h,
            width: 362.w,
            child: Align(
              alignment: Alignment.bottomRight,
              child: nickNameUnderMessage,
            ),
          ),
        ],
      ),
    );
  }

  // Widget selectUniversityButtonPage() {
  //   return Visibility(
  //     visible: univVisible,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           '대학교를 등록해주세요.',
  //           style: nanumFontBold(24.0),
  //           textAlign: TextAlign.start,
  //         ),
  //         SizedBox(
  //           height: 60.0.h,
  //         ),
  //         BasicButton(
  //           width: 362.w,
  //           height: 59.h,
  //           text: '대학 등록하기',
  //           onpressed: () {
  //             setState(() {
  //               univVisible = false;
  //               univSearchVisible = true;
  //             });
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget searchUniversityPage() {
    return Visibility(
      visible: univSearchVisible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '학교명을 입력해주세요.',
            style: nanumFontBold(23.0),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 362.w,
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
              style: nanumFontNormal(18.0),
              onChanged: (value) {
                setState(() {});
                getSchoolSuggestion(schoolNameController.text);
              },
              controller: schoolNameController,
            ),
          ),
          SizedBox(
            height: 600.h,
            child: Scrollbar(
              thickness: 4.0,
              radius: const Radius.circular(5.0),
              thumbVisibility: false,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: schoolSuggestion.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 70.h,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              schoolSuggestion[index].name,
                              style: nanumFontNormal(17.0),
                            ),
                            contentPadding: EdgeInsets.zero,
                            // trailing: const Icon(Icons.navigate_next),
                            shape: const Border(
                                bottom: BorderSide(color: Colors.grey)),
                            onTap: () {
                              setState(() {
                                university = schoolSuggestion[index].name;
                                univDomain = schoolSuggestion[index].domain;
                                univSearchVisible = false;
                                univEmailVisible = true;
                              });
                            },
                          ),
                        ],
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputEmailPage() {
    return Visibility(
      visible: univEmailVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '학교 이메일을 입력해주세요.',
            style: nanumFontBold(23.0),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 30.0.h,
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ID',
                  ),
                  style: nanumFontNormal(20.0),
                  controller: univEmailController,
                  onSubmitted: (value) async{

                    setState(() {
                      univEmail = value + "@" +univDomain;
                      univEmailVisible = false;
                      emailValidVisible = true;
                    });
                    var url = Uri.parse('http://localhost:8080/api/v1/univMailAuth/sendMail');
                    var body = json.encode({"userId": "userId","clientEmail": univEmail});
                    final response = await http.post(url, headers: {
                      "Content-Type": "application/json",
                    }, body: body ); //TODO Response 받아서 이메일 전송중입니다...전송완료도 넣으면 좋을듯 이메일 api가 지연시간이 좀 있음.
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: Text(
                  '@ $univDomain',
                  style: nanumFontNormal(20.0),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.blue,
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Widget checkEmailValidationPage() {
    return Visibility(
      visible: emailValidVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '전송된 인증번호를 입력해주세요.',
            style: nanumFontBold(23.0),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 30.0.h,
          ),
          SizedBox(
            width: 362.w,
            child: TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(),
                hintText: '인증번호',
              ),
              style: nanumFontNormal(20.0),
              controller: emailValidController,
              onSubmitted: (value) async{
                setState(() {
                  emailValidVisible = false;
                  departmentVisible = true;
                });
                var url = Uri.parse('http://localhost:8080/api/v1/univMailAuth/verifyCode');
                var body = json.encode({"userId": "userId","code": value});
                final response = await http.post(url, headers: {
                  "Content-Type": "application/json",
                }, body: body ); //TODO response 받아서 분기처리해야함. 아직 서버단에서 customException 만들지 않아서 서버작업 후 작업하겠음

              },
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget departmentPage() {
    return Visibility(
      visible: departmentVisible,
      child: SizedBox(
        width: 362.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '학과계열과 학번을 선택해주세요.',
              style: nanumFontBold(23.0),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 30.0.h,
            ),
            SizedBox(
              child: DropdownButton(
                value: department,
                isExpanded: true,
                hint: const Text('학과계열'),
                onChanged: (value) {
                  setState(() {
                    department = value!;
                  });
                },
                items: _departmentList
                    .map((String e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: nanumFontNormal(17.0),
                        )))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 107.w,
                child: DropdownButton(
                  value: schoolClass,
                  isExpanded: true,
                  hint: const Text('학번'),
                  onChanged: (value) {
                    setState(() {
                      schoolClass = value!;
                    });
                  },
                  items: _schoolClassList
                      .map((int e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.toString(),
                            style: nanumFontNormal(17.0),
                          )))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 450.h,
            ),
            Center(
              child: BasicButton(
                width: 353.w,
                height: 70.h,
                text: '가입 완료',
                onpressed: () {
                  setState(() {
                    departmentVisible = false;
                    welcomeVisible = true;
                  });
                  print('닉네임: $nickName');
                  print('학교: $university');
                  print('이메일: $univEmail');
                  print('학과: $department');
                  print('학번: $schoolClass');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget welcomePage() {
    return Visibility(
      visible: welcomeVisible,
      child: Column(
        children: [
          Text('가입이 완료되었어요.', style: nanumFontBold(23.0)),
          SizedBox(height: 6.h),
          Text('매칭을 시작해보세요!', style: nanumFontBold(23.0)),
          SizedBox(
            height: 100.h,
          ),
          Lottie.asset('assets/images/loading.json'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nickNameController.dispose();
    schoolNameController.dispose();
    univEmailController.dispose();
    emailValidController.dispose();
    super.dispose();
  }
}
