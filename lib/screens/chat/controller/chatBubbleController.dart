import 'package:get/get.dart';
import 'package:ting_flutter/screens/chat/controller/chatBubbleChunkController.dart';

import '../model/chatBubble.dart';

class ChatBubbleController extends GetxController{
  final List<NickNameWithChatBubbleChunk> _messageChunkList = <NickNameWithChatBubbleChunk>[].obs;
  final ChatBubbleChunkController chatBubbleChunkController = Get.find<ChatBubbleChunkController>();

  List<NickNameWithChatBubbleChunk> getList(){
    return _messageChunkList;
  }

  void addNewChunk(NickNameWithChatBubbleChunk chunk){
    _messageChunkList.add(chunk);
  }
}