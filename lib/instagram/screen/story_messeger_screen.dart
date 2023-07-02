import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ui_project/instagram/model/messgeModel.dart';
import 'package:ui_project/instagram/provider/message_provider.dart';

import '../provider/story_provider.dart';

class MessgerScreen extends StatefulWidget {
  const MessgerScreen({Key? key}) : super(key: key);

  @override
  State<MessgerScreen> createState() => _MessgerScreenState();
}

class _MessgerScreenState extends State<MessgerScreen> {
  MessageProvider? providerF;
  MessageProvider? providerT;
  bool txtserch=false;
  bool serch=false;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<MessageProvider>(context, listen: false);
    providerT = Provider.of<MessageProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // enabled: txtserch,
                onTap: () {
                  setState(() {

                        txtserch=true;
                        serch=txtserch;

                  });
                },

                onChanged: (value) {
                  providerF!.serchName(value);

                },

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Visibility(
              visible:serch,
              child: SizedBox(
                height: 50,
                child: Consumer<MessageProvider>(builder: (context, value, child) =>  ListView.builder(itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${providerF!.list1[index].name}"),
                    );
                  },itemCount: providerT!.list1.length,),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Colors.black26)],),
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "${providerF!.imgList[index].img}"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${providerF!.imgList[index].name}",
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
            ListTile(
              leading: Text(
                "Messages !",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "Requests",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.black26)]),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: providerT!.itemList[index].img!.isEmpty
                            ? CircleAvatar(
                                backgroundImage: AssetImage('${providerF!.imgList[index].img}'),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(
                                    File("${providerT!.itemList[index].img}")),
                              ),
                        // CachedNetworkImage(imageUrl: '${providerF!.itemList[index].img}',
                        //     progressIndicatorBuilder: (context, url, progress) => Center(
                        //       child: FileImage(File("${providerT!.path}"));
                        //     )
                        //
                        // ),
                        // AssetImage("${providerF!.itemList[index].img}")
                        // FileImage(File("${providerT!.path}"),),
                      ),
                    ),
                    title: Text("${providerF!.itemList[index].name}"),
                    subtitle: Text("${providerF!.itemList[index].link}"),
                    trailing: IconButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? xfile = await imagePicker.pickImage(
                              source: ImageSource.gallery);

                          MessgeModel messgeModel = MessgeModel(
                              img: xfile!.path,
                              link: providerF!.itemList[index].link,
                              name: providerF!.itemList[index].name);

                          providerF!.changeImagePath(messgeModel,index);
                        },
                        icon: Icon(Icons.photo_camera_outlined),),
                  ),
                ),
                itemCount: providerF!.itemList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
