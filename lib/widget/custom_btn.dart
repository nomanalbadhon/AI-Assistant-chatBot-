import 'package:flutter/material.dart';
import '../helper/global.dart';
class CustomBtn extends StatelessWidget
{
  final String text;
  final VoidCallback onTap;
  const CustomBtn({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context)
  {
    return Align(
      alignment:Alignment.bottomCenter,
      child:ElevatedButton(
          style:ElevatedButton.styleFrom(
              shape:const StadiumBorder(),
              elevation:0,
              backgroundColor:Colors.blue, // Replaced custom color with a standard one
              minimumSize:Size(mq.width * .4, 50)),
          onPressed:onTap,
          child:Text(text,
              style:const TextStyle(
                  fontSize:16,color:Colors.white,letterSpacing:.5))),
    );
  }
}
