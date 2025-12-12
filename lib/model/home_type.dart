import 'package:flutter/material.dart';

enum HomeType
{
  chatbot,
  image,
  translator;

  //getters
  String get title => switch (this)
  {
        HomeType.chatbot => 'AI ChatBot',
        HomeType.image => '.',
        HomeType.translator => '.',
      };

  String get lottie => switch (this) {
        HomeType.chatbot => 'ai_hand_waving.json',
        HomeType.image => 'ai_play.json',
        HomeType.translator => 'ai_ask_me.json',
      };

  EdgeInsets get padding => switch (this) {
        HomeType.chatbot => const EdgeInsets.all(20),
        HomeType.image => const EdgeInsets.all(20),
        HomeType.translator => const EdgeInsets.all(20),
      };

  bool get leftAlign => switch (this) {
        HomeType.chatbot => true,
        HomeType.image => false,
        HomeType.translator => true,
      };

  VoidCallback get onTap => switch (this) {
        HomeType.chatbot => () {},
        HomeType.image => () {},
        HomeType.translator => () {},
      };
}
