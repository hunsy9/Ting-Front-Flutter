import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ting_flutter/components/chatRoomAppbar.dart';
import '../controller/chatBubbleListController.dart';
import 'package:http/http.dart' as http;
import '../model/chatBubbleWithProfile.dart';
import 'package:web_socket_channel/io.dart';
import '../model/startMatching.dart';

final channel = IOWebSocketChannel.connect('ws://localhost:8080/chat');

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  final ScrollController _scrollController = ScrollController();

  void _scrollCurrent(){
    if (_scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 50), () {
        _scrollController?.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  final ChatBubbleListController _chatBubbleListController =
      Get.put(ChatBubbleListController());

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();

  // 텍스트필드에 입력된 데이터의 존재 여부
  bool _isComposing = false;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatRoomAppBar("매칭 채팅", context),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              // 리스트뷰를 Flexible로 추가.
              Obx(
                () => Flexible(
                  // 리스트뷰 추가
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _chatBubbleListController.getList().length,
                    itemBuilder: (context, index) =>
                        _chatBubbleListController.getList()[index],
                  ),
                ),
              ),
              // 구분선
              Divider(height: 1.0),
              // 메시지 입력을 받은 위젯(_buildTextCompose)추가
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _buildTextComposer(),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
          Positioned(
            bottom: 100, // 버튼의 아래쪽 여백
            right: 20, // 버튼의 오른쪽 여백
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: const Size(40, 40),
                shape: const CircleBorder(),
              ),
              onPressed: () {
                _scrollDown();
              },
              child: const Icon(
                Icons.expand_more,
                color: Color(0xff8f8f8f),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 사용자로부터 메시지를 입력받는 위젯 선언
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).hintColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: <Widget>[
            // 텍스트 입력 필드
            Flexible(
              child: TextField(
                controller: _textController,
                // 입력된 텍스트에 변화가 있을 때 마다
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                // 키보드상에서 확인을 누를 경우. 입력값이 있을 때에만 _handleSubmitted 호출
                onSubmitted: _isComposing ? _handleSubmitted : null,
                // 텍스트 필드에 힌트 텍스트 추가
                decoration:
                    InputDecoration.collapsed(hintText: "메시지를 입력해주세요..."),
              ),
            ),
            // 전송 버튼
            Container(
              // 플랫폼 종류에 따라 적당한 버튼 추가
              child: IconButton(
                // 아이콘 버튼에 전송 아이콘 추가
                icon: Icon(CupertinoIcons.paperplane, size: 25,),
                // 입력된 텍스트가 존재할 경우에만 _handleSubmitted 호출
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessageToBroker(String text) {
    String url = "http://localhost:8080/kafka/test/message?message=$text";
    http.post(Uri.parse(url));
  }

  // 메시지 전송 버튼이 클릭될 때 호출
  void _handleSubmitted(String text) {
    _sendMessageToBroker(text);
    // 텍스트 필드의 내용 삭제
    _textController.clear();
    // _isComposing을 false로 설정
    setState(() {
      _isComposing = false;
    });

    DateTime dt = DateTime.now();
    final String halfTime = dt.hour > 12 ? "오후" : "오전";
    final int hour = halfTime == "오후" ? (dt.hour - 12) : dt.hour;
    final int minute = dt.minute;
    final String currTime = "${halfTime} ${hour}시 ${minute}분";
    // 입력받은 텍스트를 이용해서 리스트에 추가할 메시지 생성
    ChatBubbleWithProfile message = ChatBubbleWithProfile(
      nickName: "유승훈",
      message: text,
      currTime: currTime,
    );
    // 리스트에 메시지 추가
    _chatBubbleListController.addNewChunk(message);
    _scrollCurrent();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
