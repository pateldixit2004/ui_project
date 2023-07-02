import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui_project/instagram/provider/story_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  StoryProvider? providerF;
  StoryProvider? providerT;
  GlobalKey golbalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<StoryProvider>(context, listen: false);
    providerT = Provider.of<StoryProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Center(
              child: Row(
                children: [
                  Text(
                    "instagram",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            actions: [
              Icon(Icons.favorite_border),
              SizedBox(
                width: 7,
              ),
              IconButton(onPressed: () {
                Navigator.pushNamed(context, 'msg');
              }, icon: Icon(Icons.chat_bubble_outline),),
              SizedBox(
                width: 7,
              ),
            ],
          ),

          // SliverList(delegate: SliverChildBuilderDelegate((context, index) => CircleAvatar(),childCount: 10)),
          SliverToBoxAdapter(
            child: Container(
              height: 88,
              child: Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onDoubleTap: () async {
                            String link =
                                "https:${providerF!.itemList[index].link}";
                            await launchUrl(Uri.parse(link));
                          },
                          onLongPress: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.blue,
                              context: context,
                              builder: (context) =>  BottomSheet(onClosing: () {

                              }, builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("View profile",style: TextStyle(fontSize: 25),),
                                    SizedBox(height: 10,),
                                    Text("Mute"),
                                  ],
                                );
                              },),
                            );
                          },
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    backgroundColor: Colors.green,
                                    content: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              RenderRepaintBoundary?
                                                  renderBoundry = golbalKey
                                                          .currentContext!
                                                          .findRenderObject()
                                                      as RenderRepaintBoundary;
                                              var image =
                                                  await renderBoundry.toImage();
                                              var byteData =
                                                  await image.toByteData(
                                                      format:
                                                          ImageByteFormat.png);
                                              Uint8List uint8List = byteData!
                                                  .buffer
                                                  .asUint8List();
                                              await ImageGallerySaver.saveImage(
                                                  uint8List);
                                            },
                                            icon: Icon(Icons.camera)),
                                        RepaintBoundary(
                                          key: golbalKey,
                                          child: CircleAvatar(
                                            radius: 100,
                                            backgroundImage: AssetImage(
                                                "${providerF!.itemList[index].img}"),
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Colors.yellowAccent,
                                Colors.pinkAccent
                              ]),
                            ),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "${providerF!.itemList[index].img}"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${providerF!.itemList[index].name}",
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: providerF!.itemList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => post(
                      img: '${providerF!.postList[index].logo}',
                      postname: '${providerF!.postList[index].name}',
                      photo: '${providerF!.postList[index].post}',
                      con: '${providerF!.postList[index].capition}',
                      time: '${providerF!.postList[index].time}'),
                  childCount: providerF!.postList.length)),

          SliverToBoxAdapter(
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    "Suggested for you",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  height: 270,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle),
                  child: Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(spreadRadius: 1)]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  height: 100,
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
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => post(index: index,
                      img: '${providerF!.postList[index].logo}',
                      postname: '${providerF!.postList[index].name}',
                      photo: '${providerF!.postList[index].post}',
                      con: '${providerF!.postList[index].capition}',
                      time: '${providerF!.postList[index].time}'),
                  childCount: providerF!.postList.length)),
        ],
      ),


    ));
  }

  Widget post(
      {String? img,
      String? postname,
      String? photo,
      String? con,
      String? time,int? index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('$img'),
          ),
          title: Text(
            "$postname",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("$photo"), fit: BoxFit.contain)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               


                providerT!.icon==true?IconButton(onPressed: () {

                  providerF!.changeIcon1();
                }, icon: Icon(Icons.favorite,color: Colors.red,)):
                IconButton(onPressed: () {

                providerF!.changeIcon();
                }, icon: Icon(Icons.favorite_border)),


                // IconButton(onPressed: () {
                //   providerF!.changeIcon();
                // }, icon: Icon(Icons.favorite,)),
                
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                IconButton(
                    onPressed: () {



                      Share.share('${providerF!.postList[index!].post}');
                      
                      Share.shareXFiles([]);

                    }, icon: Icon(Icons.telegram_rounded)),
              ],
            ),
            IconButton(onPressed: () {




              providerF!.savedList.add("${providerF!.postList[index!].post}");

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("yes")));

              print('${providerF!.savedList}');


            }, icon: Icon(Icons.bookmark_add_outlined)),
          ],
        ),

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "${postname}-",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${con}"),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/image/dixit.jpg'),
              ),
              SizedBox(
                width: 3,
              ),
              Text('Add a comment'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("${time}"),
              SizedBox(
                width: 3,
              ),
              Text(
                "See translation ",
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget suggest() {
    return Column(
      children: [Container()],
    );
  }
}
