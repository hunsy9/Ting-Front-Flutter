import 'package:get/get.dart';

class ChatBubbleChunkController extends GetxController{

  final List<String> chatbubbleChunk = <String>[].obs;

  List<String> getChunkList(){
    return chatbubbleChunk;
  }

  void appendNewChat(text) {
    chatbubbleChunk.add(text);
  }

}