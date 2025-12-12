import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/model/message.dart';

class ChatController extends GetxController
{
  final textC=TextEditingController();
  final scrollC=ScrollController();
  final list=<Message>[].obs;
  Future<void> askQuestion() async
  {
    if (textC.text.trim().isNotEmpty)
    {
      final question=textC.text;
      textC.text=''; // Clear input field immediately

      // Add user message and a placeholder for the bot's response
      list.addAll([
        Message(msg:question,msgType:MessageType.user),
        Message(msg:'',msgType:MessageType.bot)
      ]);
      _scrollToBottom();
      final res=await APIs.getAnswer(question);


      // Create a new list from the old one.
      final newList=list.toList();
      newList[newList.length - 1] = Message(msg: res, msgType: MessageType.bot);

      // UI update.
      list.assignAll(newList);
      _scrollToBottom();
    }
  }

  // For scrolling to the bottom of the chat
  void _scrollToBottom()
  {
    Future.delayed(const Duration(milliseconds: 100), ()
    {
      if (scrollC.hasClients)
      {
        scrollC.animateTo(
          scrollC.position.maxScrollExtent,
          duration:const Duration(milliseconds: 500),
          curve:Curves.easeOut,
        );
      }
    });
  }
}
