import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project/instagram/provider/serch_photo/serch_provider.dart';
import 'package:ui_project/instagram/provider/story_provider.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  SerchProvider? providerF;
  SerchProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<SerchProvider>(context, listen: false);
    providerT = Provider.of<SerchProvider>(context, listen: true);

    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {

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
          SizedBox(height: 2.h,),
          Expanded(
            child: MasonryGridView.count(crossAxisCount: 3,  mainAxisSpacing:5,itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                child: Image.asset("${providerF!.serchPhotoList[index]}"),
              );
            },itemCount: providerF!.serchPhotoList.length,),
          ),
        ],
      ),
    ),);
  }
}
