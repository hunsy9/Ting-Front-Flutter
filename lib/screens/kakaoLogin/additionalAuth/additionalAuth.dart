import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubble/bubble.dart';
import 'package:ting_flutter/screens/kakaoLogin/additionalAuth/components/basicbutton.dart';
import 'package:ting_flutter/screens/kakaoLogin/additionalAuth/components/NanumFont.dart';
import 'components/SchoolInfoAndFetch.dart';
import 'components/textValidCheck.dart';
import 'package:lottie/lottie.dart';
import 'components/customBubbleChat.dart';

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
      userDepartment = _departmentList[0];
      userSchoolClass = _schoolClassList[0];
    });
  }

  late List<SchoolInfo> schoolList; // 처음 시작할 때 학교 정보들 다 받아서 저장
  List<SchoolInfo> schoolSuggestion = [];

  final nickNameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final univEmailController = TextEditingController();
  final emailValidController = TextEditingController();

  late bool nickNameValid = false;
  bool emailValid = false;
  bool emailValidChecked = true;
  bool departmentValid = false;
  bool schoolClassValid = false;

  late Row nickNameUnderMessage = Row();

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
  bool cannotReceiveEmailVisible = false;

  // user 정보
  String userNickName = "";
  String userUniversity = "";
  String userEmail = "";
  String userUnivDomain = "";
  String userInputEmailToken = "";
  String userDepartment = "";
  int userSchoolClass = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(45.0.w, 169.h, 45.0.w, 60.0.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
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
            )),
            navigationBar(),
          ],
        ),
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

  void navigateBefore() {
    setState(() {
      if (univSearchVisible) {
        nickNameVisible = true;
        univSearchVisible = false;
      } else if (univEmailVisible) {
        univEmailVisible = false;
        univSearchVisible = true;
      } else if (emailValidVisible) {
        cannotReceiveEmailVisible = false;
        emailValidVisible = false;
        univEmailVisible = true;
      } else if (departmentVisible) {
        departmentVisible = false;
        univEmailVisible = true;
      }
    });
  }

  void navigateNext() {
    setState(() {
      if (nickNameVisible) {
        setUserNickName(nickNameController.text);
      } else if (univSearchVisible) {
        univSearchVisible = false;
        univEmailVisible = true;
      } else if (univEmailVisible) {
        setUserEmail('${univEmailController.text}@$userUnivDomain');
        sendEmailValidCode(userEmail);
      } else if (emailValidVisible) {
        setEmailValidationCheck(userInputEmailToken);
      } else if (departmentVisible) {
        setState(() {
          departmentVisible = false;
          welcomeVisible = true;
        });
        debugPrint('닉네임: $userNickName');
        debugPrint('학교: $userUniversity');
        debugPrint('이메일: $userEmail');
        debugPrint('학과: $userDepartment');
        debugPrint('학번: $userSchoolClass');
      }
    });
  }

  bool canNavigateBefore() {
    return nickNameVisible ? false : true;
  }

  bool canNavigateNext() {
    if (nickNameVisible) {
      if (nickNameValid) {
        return true;
      }
    } else if (univEmailVisible) {
      if (emailValid) {
        return true;
      }
    } else if (emailValidVisible) {
      if (emailValidChecked) {
        return true;
      }
    } else if (departmentVisible) {
      return true;
    }

    return false;
  }

  void sendEmailValidCode(String email) async {
    var url = Uri.parse('http://localhost:8080/api/v1/univMailAuth/sendMail');
    var body = json.encode({"userId": "userId", "clientEmail": userEmail});
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body:
            body); //TODO Response 받아서 이메일 전송중입니다...전송완료도 넣으면 좋을듯 이메일 api가 지연시간이 좀 있음.
  }

  void checkEmailValidCode(String code) async {
    var url = Uri.parse('http://localhost:8080/api/v1/univMailAuth/verifyCode');
    var body = json.encode({"userId": "userId", "code": code});
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body:
            body); //TODO response 받아서 분기처리해야함. 아직 서버단에서 customException 만들지 않아서 서버작업 후 작업하겠음
  }

  void setUserNickName(String nickName) {
    if (nickNameValid) {
      setState(() {
        userNickName = nickNameController.text;

        nickNameVisible = false;
        univSearchVisible = true;
      });
      debugPrint('NickName set: $userNickName');
    }
  }

  void setUserEmail(String email) {
    if (emailValid) {
      setState(() {
        userEmail = email;
        univEmailVisible = false;
        emailValidVisible = true;
      });
      debugPrint('Email set: $userEmail');
    }
  }

  void setUserUniversityAndDomain(String inputUniversity, String inputDomain) {
    setState(() {
      userUniversity = inputUniversity;
      userUnivDomain = inputDomain;
      univSearchVisible = false;
      univEmailVisible = true;
    });
    debugPrint('University set: $userUniversity, Domain set: $userUnivDomain');
  }

  void setNickNameValidation(String inputNickName) {
    setState(() {
      Map<String, dynamic> currentNickName = nickNameCheck(inputNickName);
      nickNameValid = currentNickName['validation'];
      nickNameUnderMessage = currentNickName['helpMessage'];
    });
  }

  void setEmailValidationCheck(String token) {
    setState(() {
      setState(() {
        emailValidVisible = false;
        departmentVisible = true;
      });
    });
  }

  Widget nickNamePage() {
    return Visibility(
      visible: nickNameVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
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
                setUserNickName(value);
              },
              onChanged: (value) {
                setNickNameValidation(value);
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
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
              style: nanumFontNormal(18.0),
              onChanged: (value) {
                setState(() {
                  getSchoolSuggestion(schoolNameController.text);
                });
              },
              controller: schoolNameController,
            ),
          ),
          Flexible(
            child: Scrollbar(
              thickness: 4.0,
              radius: const Radius.circular(5.0),
              thumbVisibility: false,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: schoolSuggestion.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      schoolSuggestion[index].name,
                      style: nanumFontNormal(17.0),
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.school_outlined),
                    shape: const Border(bottom: BorderSide(color: Colors.grey)),
                    onTap: () {
                      setUserUniversityAndDomain(schoolSuggestion[index].name,
                          schoolSuggestion[index].domain);
                    },
                  );
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
                  onChanged: (value) {
                    setState(() {
                      emailValid = isEmailValid("$value@$userUnivDomain");
                    });
                  },
                  onSubmitted: (value) async {
                    setUserEmail("${univEmailController.text}@$userUnivDomain");
                    sendEmailValidCode(userEmail);
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                child: Text(
                  '@ $userUnivDomain',
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
              onSubmitted: (value) {
                setEmailValidationCheck(value);
              },
              onChanged: (value) {
                setState(() {
                  userInputEmailToken = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 362.w,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text(
                  '인증번호가 오지 않나요?',
                  style: nanumFontNormal(12),
                ),
                onPressed: () {
                  setState(() {
                    cannotReceiveEmailVisible = true;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: cannotReceiveEmailVisible,
            child: SizedBox(
              height: 400.h,
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.support_agent),
                      Expanded(
                        child: Bubble(
                          alignment: Alignment.topLeft,
                          // nipWidth: 15.w,
                          nipHeight: 10.h,
                          nip: BubbleNip.leftCenter,
                          color: const Color.fromARGB(255, 194, 222, 245),
                          child: const Text(
                            '인증 메일 도착까지 최대 3분정도 걸릴 수 있어요.',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      const Icon(Icons.support_agent),
                      Expanded(
                        child: Bubble(
                          alignment: Alignment.topLeft,
                          // nipWidth: 15.w,
                          nipHeight: 10.h,
                          nip: BubbleNip.leftCenter,
                          color: const Color.fromARGB(255, 194, 222, 245),
                          child: const Text(
                            '3분이 지나도 오지 않는다면 뒤로 가기를 눌러 이메일 주소를 확인하고 다시 시도해주세요 :)',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      const Icon(Icons.support_agent),
                      Expanded(
                        child: Bubble(
                          alignment: Alignment.topLeft,
                          // nipWidth: 15.w,
                          nipHeight: 10.h,
                          nip: BubbleNip.leftCenter,
                          color: const Color.fromARGB(255, 194, 222, 245),
                          child: const Text(
                            '번거롭더라도 더 나은 서비스를 위한 절차이니 이해해 주실거죠?? ㅎㅎ',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                value: userDepartment,
                isExpanded: true,
                hint: const Text('학과계열'),
                onChanged: (value) {
                  setState(() {
                    userDepartment = value!;
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
                  value: userSchoolClass,
                  isExpanded: true,
                  hint: const Text('학번'),
                  onChanged: (value) {
                    setState(() {
                      userSchoolClass = value!;
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

  Widget navigationBar() {
    return Visibility(
      visible: !welcomeVisible,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.blue,
          onPressed: canNavigateBefore() ? (() => navigateBefore()) : null,
          icon: const Icon(
            Icons.navigate_before,
            size: 40,
          ),
        ),
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.blue,
          onPressed: canNavigateNext() ? (() => navigateNext()) : null,
          icon: departmentVisible
              ? const Icon(
                  Icons.done,
                  size: 40,
                )
              : const Icon(
                  Icons.navigate_next,
                  size: 40,
                ),
        ),
      ]),
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