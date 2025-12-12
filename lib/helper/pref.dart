import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  //initializing hive
  static late Box _box;
  static Future<void> initialize() async
  {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    _box=await Hive.openBox('myData');
  }
  //storing user choice
  static bool get showOnboarding =>
      _box.get('showOnboarding',defaultValue:true);
  static set showOnboarding(bool v) => _box.put('showOnboarding', v);

  // for storing theme data
  static bool get isDarkMode => _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool v) => _box.put('isDarkMode', v);
}
