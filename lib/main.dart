import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for storing user preferences
  await Pref.initialize();

  // Set system UI and orientation
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,

      //theme
      theme: ThemeData(
        useMaterial3:false,
        brightness:Brightness.light,
        appBarTheme:const AppBarTheme(
          elevation:1,
          centerTitle:true,
          backgroundColor:Colors.white,
          iconTheme:IconThemeData(color:Colors.black),
          titleTextStyle:TextStyle(
            color:Colors.black,
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
        ),
      ),

      //dark theme
      darkTheme:ThemeData(
        brightness:Brightness.dark,
        useMaterial3:false,
        appBarTheme:const AppBarTheme(
          elevation:1,
          centerTitle:true,
          backgroundColor:Colors.black87,
          iconTheme:IconThemeData(color:Colors.white),
          titleTextStyle:TextStyle(
            color:Colors.white,
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
        ),
      ),
      themeMode:Pref.isDarkMode ? ThemeMode.dark :ThemeMode.light,
      home:const SplashScreen(),
    );
  }
}
