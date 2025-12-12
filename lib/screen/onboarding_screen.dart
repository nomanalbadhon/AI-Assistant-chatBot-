import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../helper/global.dart';
import '../model/onboard.dart';
import '../widget/custom_btn.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget
{
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context)
  {
    final c=PageController();
    final list=[
      //onboarding 1
      Onboard(
          title:'Ask me Anything',
          subtitle:'I can be your Best Friend & You can ask me anything',
          lottie:'ai_ask_me'),

      //onboarding 2
      Onboard(
          title:'Imagination to Reality',
          subtitle:'Just imagine and let me know, I will create for you in seconds',
          lottie:'ai_play'),
    ];
    return Scaffold(
      body:PageView.builder(
        controller:c,
        itemCount:list.length,
        itemBuilder:(ctx, ind)
        {
          final isLast = ind == list.length - 1;

          return Column(
            children:[
              //lottie
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: mq.height * .6, width: isLast ? mq.width * .7 : null),

              //title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
              ),

              //for adding some space
              SizedBox(height: mq.height * .015),

              //subtitle
              SizedBox(
                width:mq.width * .7,
                child:Text(
                  list[ind].subtitle,
                  textAlign:TextAlign.center,
                  style:const TextStyle(
                      fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
                ),
              ),

              const Spacer(),

              //dots
              Wrap(
                spacing:10,
                children:List.generate(
                    list.length, (i) => _indicator(isLast: i == ind)),
              ),
              const Spacer(),

              //button
              CustomBtn(
                  onTap:()
                  {
                    if (isLast)
                    {
                      Get.off(() => const HomeScreen());
                    }
                    else
                    {
                      c.nextPage(
                          duration:const Duration(milliseconds: 600),
                          curve:Curves.ease);
                    }
                  },
                  text: isLast ? 'Finish' : 'Next'),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

//dots
Widget _indicator({required bool isLast})
{
  return Container(
    height:isLast ? 12 : 10,
    width:isLast ? 12 : 10,
    decoration:BoxDecoration(
        color: isLast ? Colors.blue : Colors.grey,
        borderRadius:const BorderRadius.all(Radius.circular(12))),
  );
}
