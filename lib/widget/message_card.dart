import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/global.dart';
import '../model/message.dart';

class MessageCard extends StatelessWidget
{
  final Message message;
  const MessageCard({super.key,required this.message});
  @override
  Widget build(BuildContext context)
  {
    const r=Radius.circular(15);
    return message.msgType==MessageType.bot
        // Bot message
        ? Row(
            children:[
              const SizedBox(width: 6),
              const CircleAvatar(
                radius:18,
                backgroundColor:Colors.white,
                child:Icon(Icons.smart_toy_outlined,color:Colors.black,size: 24),
              ),

              // Message content
              Container(
                constraints:BoxConstraints(maxWidth: mq.width * .6),
                margin:EdgeInsets.only(bottom: mq.height * .02, left: mq.width * .02),
                padding:EdgeInsets.symmetric(
                    vertical:mq.height * .01,horizontal:mq.width * .02),
                decoration:BoxDecoration(
                    border:Border.all(color:Theme.of(context).dividerColor),
                    borderRadius:const BorderRadius.only(topLeft: r,topRight: r,bottomRight: r)),
                child:message.msg.isEmpty
                    // **THE FIX:** Replaced complex animation with a simple Text widget
                    ? const Text('...', style:TextStyle(fontWeight:FontWeight.w500))
                    : SelectableText(
                        message.msg.trim(), 
                        style:const TextStyle(fontSize:15,fontWeight:FontWeight.w500),
                      ),
              )
            ],
          )
        // User message
        : Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children:[
              // Message content
              Container(
                  constraints:BoxConstraints(maxWidth: mq.width * .6),
                  margin:EdgeInsets.only(bottom: mq.height * .02,right: mq.width * .02),
                  padding:EdgeInsets.symmetric(
                      vertical:mq.height * .01,horizontal:mq.width * .02),
                  decoration:BoxDecoration(
                      border:Border.all(color:Theme.of(context).dividerColor),
                      borderRadius:const BorderRadius.only(
                          topLeft:r, topRight: r, bottomLeft: r)),
                  child: SelectableText(
                    message.msg.trim(),
                    style: const TextStyle(fontSize: 15,fontWeight:FontWeight.w500),
                  )),

              // Icon
              const CircleAvatar(
                  radius: 18,
                  backgroundColor:Colors.white,
                  child:Icon(Icons.person,color:Colors.black)),
              const SizedBox(width: 6),
            ],
          );
  }
}
