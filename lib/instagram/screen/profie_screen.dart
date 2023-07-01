import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project/instagram/screen/story_screen.dart';

import '../provider/profile_provider/profileprovider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider? providerF;
  ProfileProvider? providerT;


  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<ProfileProvider>(context, listen: false);
    providerT = Provider.of<ProfileProvider>(context, listen: true);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: SizedBox(
                width: 20,
                child: Center(
                    child: Text(
                  "Dixit_",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ))),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {

                    showModalBottomSheet(context: context,
                      builder: (context) =>  BottomSheet(onClosing: () {

                      }, builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            ListTile(
                              leading: Icon(Icons.settings,color: Colors.black,),
                              title: Text("Setting and privacy"),
                            ),
                            ListTile(
                              leading: Icon(Icons.alarm,color: Colors.black,),
                              title: Text("Your activity "),
                            ),
                            ListTile(
                              leading: Icon(Icons.archive,color: Colors.black,),
                              title: Text("Archive "),
                            ),
                            ListTile(
                              leading: Icon(Icons.qr_code_2,color: Colors.black,),
                              title: Text("QR code "),
                            ),
                            ListTile(
                              leading: Icon(Icons.copy_sharp,color: Colors.black,),
                              title: Text("Saved "),
                            ),
                            ListTile(
                              leading: Icon(Icons.person,color: Colors.black,),
                              title: Text("Supervision "),
                            ),
                            ListTile(
                              leading: Icon(Icons.vertical_distribute_outlined,color: Colors.black,),
                              title: Text("Close Friends "),
                            ),
                            ListTile(
                              leading: Icon(Icons.star_border_outlined,color: Colors.black,),
                              title: Text("Favorites"),
                            ),






                          ],
                        );
                      },),
                    );

                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/image/dixit.jpg"),
                          ),
                          Text(
                            "Dixit Patoliya",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 7.w,),
                    Center(child: foll(p: '10', F: '2000', f: '2'))
                  ],
                ),
                button(),
                SizedBox(height: 2.h),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(color: Colors.black38)]),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "${providerF!.helightList[index].img}"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${providerF!.helightList[index].name}",
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: providerF!.helightList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                TabBar(tabs: [
                  // Text('ddd',),
                  // Text('ddd',style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.add,color: Colors.black,)),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.account_box_rounded,color: Colors.black,)),
                ],),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget foll({String? p, String? F, String? f}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 28),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "${p}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Post",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              children: [
                Text(
                  "${F}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Followers",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              width: 4.5.w,
            ),
            Column(
              children: [
                Text(
                  "${f}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Following",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget button() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 3.5.h,
            width: 38.5.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              "Edit profile",
              style: TextStyle(color: Colors.white),
            )),
          ),
          Container(
            height: 3.5.h,
            width: 38.5.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              "Share profile",
              style: TextStyle(color: Colors.white),
            )),
          ),
          InkWell(
            // onTap: () {
            //   ExpansionTile(title:Text(";hello"));
            // },
           onTap: () {
             showDialog(
               context: context,
               builder: (context) => AlertDialog(
                 backgroundColor: Colors.grey,
                 content: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Container(
                       height: 100,
                       width: 100,
                       decoration: BoxDecoration(
                         image: DecorationImage(image: AssetImage("${providerF!.suggetsList[3].img}"))
                       ),
                     ),
                     SizedBox(height: 10,),
                     Text("Virat Kohli",style: TextStyle(fontWeight: FontWeight.bold),),
                     SizedBox(height: 10,),
                     Container(
                       height: 30,
                       width: 100,
                       child: ElevatedButton(onPressed: () {

                       }, child: Text("Follow")),
                     )
                   ],
                 )
               ),
             );
           },
            onDoubleTap: () {

             showModalBottomSheet(
               context: context,

               builder: (context) =>  BottomSheet(enableDrag: false,onClosing: () {

               }, builder: (context) {
                 return SizedBox(
                   height: 300,
                   child: ListView.builder(
                   // shrinkWrap: true,
                   itemBuilder: (context, index) {
                     return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 20,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         boxShadow: [BoxShadow(spreadRadius: 1)]),
                     child: Column(
                       children: [
                         SizedBox(
                           height: 25,
                         ),
                         Container(
                           height: 80,
                           width: 100,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(color: Colors.red),
                             image: DecorationImage(
                                 image: AssetImage(
                                     "${providerF!.suggetsList[index].img}"),
                                 fit: BoxFit.fill),
                           ),
                           // child: CircleAvatar(
                           //   radius: 40,
                           //   backgroundImage: AssetImage(
                           //       "${providerF!.suggetsList[index].img}",),
                           // ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               Text(
                                 "${providerF!.suggetsList[index].name}",
                                 style: TextStyle(
                                     fontWeight: FontWeight.w700),
                               ),
                               SizedBox(
                                 height: 5,
                               ),
                               Text(
                                   "${providerF!.suggetsList[index].tagline}"),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: 25,
                             width: 180,
                             child: ElevatedButton(
                                 onPressed: () {},
                                 child: Text("Follow")),
                           ),
                         )
                       ],
                     ),
                   ),
                     );
                   },
                   itemCount: providerF!.suggetsList.length,
                   scrollDirection: Axis.horizontal,
                   ),
                 );
               },),
             );



















            },
            child: Container(
              height: 3.5.h,
              width: 8.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
