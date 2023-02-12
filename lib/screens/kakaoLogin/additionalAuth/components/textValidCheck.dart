import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './NanumFont.dart';
import 'package:http/http.dart' as http;

// 'validation': 유효성 bool, 'helpMessage': 하단에 메세지를 띄워주는 Row
Map<String, dynamic> nickNameCheck(String inputNickName) {
  Map<String, dynamic> currentNickName = {
    'validation': true,
    'helpMessage': Row(),
  };

  String underMessage = '사용 가능한 닉네임입니다.';

  if (!isNickNameFormValid(inputNickName)) {
    currentNickName['validation'] = false;
    underMessage = '닉네임은 특수문자, 공백을 포함할 수 없습니다.';
  } else if (inputNickName.length < 2 || inputNickName.length > 10) {
    currentNickName['validation'] = false;
    underMessage = '닉네임은 2글자 이상, 10글자 이하여야 합니다.';
  }

  currentNickName['helpMessage'] = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SizedBox(width: 2.0.w),
      Text(
        underMessage,
        style: TextStyle(
          fontFamily: 'nanumsquareround',
          fontSize: 11.0,
          letterSpacing: 1.0,
          color: currentNickName['validation'] ? Colors.blue : Colors.red,
        ),
      ),
    ],
  );

  return currentNickName;
}

// 한국어인지 검사
bool isKorean(String inputNickName) {
  bool flag = true;
  for (int i = 0; i < inputNickName.length; i++) {
    int uniCode = inputNickName.codeUnits[i];
    if (!(12593 <= uniCode && uniCode <= 12643) &&
        !(44032 <= uniCode && uniCode <= 55203)) {
      flag = false;
      break;
    }
  }
  return flag;
}

bool isNickNameFormValid(String inputNickName) {
  bool specialChar = inputNickName.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool blankChar = inputNickName.contains(' ');

  if (specialChar || blankChar) {
    return false;
  } else {
    return true;
  }
}

// Future<bool> isDuplicated(String inputNickName) async {
//   String url = 'http://localhost:8080/api/v1/user/duplicated/$inputNickName';
//   try {http.get(Uri.parse(url)).then((response) {
//     print(response.toString());
//     if (response.toString() == 'ok') {
//       return false;
//     } else {
//       return true;
//     }
//   }); } catch {
//     print('error');
//     rethrow;
//   };
// }

bool isEmailValid(String inputEmail) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(inputEmail);
}
