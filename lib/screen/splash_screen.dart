import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../helper/pref.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();

    //wait for some time on splash & then move to next screen
    Future.delayed(const Duration(seconds: 4), ()
    {
      Get.off(()=>
          Pref.showOnboarding ? const OnboardingScreen():const HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //body
      body:Center(
        child:Lottie.asset(
          'assets/lottie/Lottie Files.json',
          width: 200,
        ),
      ),
    );
  }
}
