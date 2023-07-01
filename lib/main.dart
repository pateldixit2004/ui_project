import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project/instagram/provider/bottonprovider.dart';
import 'package:ui_project/instagram/provider/serch_photo/serch_provider.dart';
import 'package:ui_project/instagram/provider/story_provider.dart';
import 'package:ui_project/instagram/screen/home_screen.dart';

import 'instagram/provider/message_provider.dart';
import 'instagram/provider/profile_provider/profileprovider.dart';
import 'instagram/screen/story_messeger_screen.dart';

void main()
{
  runApp(
      DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => Sizer(
        builder: (context, orientation, deviceType) =>  MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => changeScreen(),),
            ChangeNotifierProvider(create: (context) => StoryProvider(),),
            ChangeNotifierProvider(create: (context) => ProfileProvider(),),
            ChangeNotifierProvider(create: (context) => MessageProvider(),),
            ChangeNotifierProvider(create: (context) => SerchProvider(),),
            ],
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => HomeScreen(),
            'msg':(context) => MessgerScreen(),
          },
        ),
    ),
      ),
      )
  );
}