import 'package:ai_assistant/helper/pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController
{
  final RxBool isDarkMode=Pref.isDarkMode.obs;

  void toggleTheme()
  {
    isDarkMode.value=!isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    Pref.isDarkMode=isDarkMode.value;
  }
}
