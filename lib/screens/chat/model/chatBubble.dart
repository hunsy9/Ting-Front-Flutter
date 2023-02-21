import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/screens/chat/controller/chatBubbleChunkController.dart';

// 리스트뷰에 추가될 메시지덩어리 위젯
class NickNameWithChatBubbleChunk extends StatelessWidget {
  final String nickName;
  // final List<String> chatbubbleChunk = <String>[];

  NickNameWithChatBubbleChunk({required this.nickName});

  final ChatBubbleChunkController _chatBubbleChunkController =
  Get.put(ChatBubbleChunkController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 13.0),
            // 사용자명의 첫번째 글자를 서클 아바타로 표시
            child: Image.asset(
              'assets/images/chatTestProfile.png',
              height: 48.h,
            ),
          ),
          Expanded(
            // 컬럼 추가
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 사용자명을 subhead 테마로 출력
                Text(nickName, style: Theme.of(context).textTheme.bodyLarge),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _chatBubbleChunkController.getChunkList().length,
                  itemBuilder: (context, index) => BubbleSpecialOne(text: _chatBubbleChunkController.getChunkList()[index])
                )

                // Container(
                //   margin: const EdgeInsets.only(top: 5.0),
                //   child: Text(text),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
