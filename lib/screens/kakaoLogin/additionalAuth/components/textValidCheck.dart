import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './NanumFont.dart';


// 'validation': 유효성 bool, 'helpMessage': 하단에 메세지를 띄워주는 Row
Map<String, dynamic> nickNameCheck(String inputNickName) {
  Map<String, dynamic> currentNickName = {
    'validation': true,
    'helpMessage': Row(),
  };

  String underMessage = '사용 가능한 닉네임입니다.';
  Icon underIcon = const Icon(Icons.done, color: Colors.blue);

  if (inputNickName.length < 2) {
    currentNickName['validation'] = false;
    underMessage = '닉네임은 2글자 이상, 10글자 이하여야 합니다.';
    underIcon = const Icon(Icons.error_outline, color: Colors.red);
  } else if (!isKorean(inputNickName)) {
    currentNickName['validation'] = false;
    underMessage = '닉네임은 한글로만 구성할 수 있습니다.(숫자, 영어, 특수문자 제외)';
    underIcon = const Icon(Icons.error_outline, color: Colors.red);
  }

  currentNickName['helpMessage'] = Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      underIcon,
      SizedBox(width: 2.0.w),
      Text(
        underMessage,
        style: nanumFontNormal(10.0),
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
