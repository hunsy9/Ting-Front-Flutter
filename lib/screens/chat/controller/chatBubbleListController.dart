import 'package:get/get.dart';
import '../model/chatBubbleWithProfile.dart';

class ChatBubbleListController extends GetxController{

  final RxList<ChatBubbleWithProfile> _messageList = <ChatBubbleWithProfile>[].obs;

  RxList<ChatBubbleWithProfile> getList(){
    return _messageList;
  }

  void addNewChunk(ChatBubbleWithProfile chatBubbleWithProfile){
    _messageList.add(chatBubbleWithProfile);
  }
}