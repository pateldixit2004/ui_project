import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_project/instagram/provider/bottonprovider.dart';
import 'package:ui_project/instagram/screen/story_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  changeScreen? providerF;
  changeScreen? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<changeScreen>(context, listen: false);
    providerT = Provider.of<changeScreen>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (value) {
              // providerF!.screenList[providerT!.i];
              providerF!.changescreen(value);
            },
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box_rounded,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.photo_camera_front,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  label: ''),
            ],
          ),
          body: providerF!.screenList[providerT!.i]),
    );
  }
}
// CustomScrollView(
//
// slivers: [
// SliverAppBar(
// backgroundColor: Colors.black,
// leading: Center(
// child: Row(
// children: [
// Text("instagram",style: TextStyle(fontSize: 10),),
//
// ],
// ),
// ),
// actions: [
// Icon(Icons.favorite_border),
// SizedBox(width: 7,),
// Icon(Icons.chat_bubble_outline),
// SizedBox(width: 7,),
//
// ],
// )
// ),
// ],
