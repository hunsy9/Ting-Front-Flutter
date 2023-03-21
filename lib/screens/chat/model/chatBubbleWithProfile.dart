import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './chatProfile.dart';

// 리스트뷰에 추가될 메시지덩어리 위젯
class ChatBubbleWithProfile extends StatelessWidget {
  final String nickName;
  final String message;
  final String currTime;

  ChatBubbleWithProfile(
      {required this.nickName, required this.message, required this.currTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatProfile(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nickName,
                  style: const TextStyle(
                      fontFamily: 'nanumsquareround',
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  transform: Matrix4.translationValues(-16.0, 0.0, 0.0),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      BubbleSpecialTwo(
                        text: message,
                        isSender: false,
                        tail: false,
                        color: const Color(0xbc98a6d4),
                        textStyle: const TextStyle(
                            fontFamily: 'nanumsquareround',
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          currTime,
                          style: const TextStyle(
                              color: Colors.black38,
                              fontFamily: 'nanumsquareround',
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
