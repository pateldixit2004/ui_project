import 'package:flutter/foundation.dart';
import 'package:ui_project/instagram/screen/hy.dart';
import 'package:ui_project/instagram/screen/profie_screen.dart';
import 'package:ui_project/instagram/screen/serch_screen.dart';
import 'package:ui_project/instagram/screen/story_screen.dart';

class changeScreen extends ChangeNotifier {
  int i = 0;

  List screenList = [
    StoryScreen(),




    SerchScreen(),
    InstagramStoryScreen(),
    StoryScreen(),
    ProfileScreen(),

  ];

  void changescreen(int value) {
    i = value;
    notifyListeners();
  }
}
