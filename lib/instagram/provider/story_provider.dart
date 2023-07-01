import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_project/instagram/model/post_model.dart';
import 'package:ui_project/instagram/model/story_model.dart';
import 'package:ui_project/instagram/model/suggesst_model.dart';

class StoryProvider extends ChangeNotifier
{
  String? path;

  changeImagePath(String path)
  {
    this.path=path;
    notifyListeners();
  }

  List<StoryModel> itemList=[
    StoryModel(img: 'assets/image/dixit.jpg',name:'your story',link: ''),
    StoryModel(img: 'assets/image/img.png',name:'Anushka Sharma',link: 'www.instagram.com/anushkasharma/'),
    StoryModel(img: 'assets/logo/img_1.png',name:'Virat Kohli',link: 'www.instagram.com/virat.kohli/?hl=en'),
    StoryModel(img: 'assets/image/img_1.png',name:'Priyanka Chopra',link: 'www.instagram.com/priyankachopra/?hl=en'),
    StoryModel(img: 'assets/image/img_2.png',name:'Ratan Tata',link: 'www.instagram.com/ratantata/?hl=en'),
    StoryModel(img: 'assets/image/img_3.png',name:'Mukesh Ambani  ',link: 'www.ril.com/OurCompany/Leadership/Mukesh-Ambani-Chairman-and-Managing-Director.aspx'),
    StoryModel(img: 'assets/logo/img_3.png',name:'Kiara Advani ',link: 'www.instagram.com/kiaraaliaadvani/'),
    StoryModel(img: 'assets/logo/img_2.png',name:'Shubman Gill  ',link: 'www.instagram.com/shubmangill/?hl=en'),
  ];


  List<PostModel> postList=[
    PostModel(logo: 'assets/image/img_2.png',name: 'Ratan Tata',post: 'assets/image/img_2.png',capition:'Few hours to go… 🌼Stay tuned🧡🎶' ,time:'10 min ago' ),
    PostModel(logo: 'assets/logo/img_3.png',name: 'Kiara Advani',post: 'assets/post/img_4.png',capition:'Few hours to go… 🌼Stay tuned🧡🎶' ,time:'10 min ago' ),
    PostModel(logo: 'assets/image/img_3.png',name: 'Mukesh Ambani',post: 'assets/image/img_3.png',capition:'Few hours to go… 🌼Stay tuned🧡🎶' ,time:'10 min ago' ),
    PostModel(logo: 'assets/logo/img_2.png',name: 'Shubman Gill',post: 'assets/post/img_2.png',capition:'I DON’T PLAY THE ODDS, I PLAY ' ,time:'1 day ago' ),
    PostModel(logo: 'assets/logo/img_1.png',name: 'Virat Kohli',post: 'assets/post/img_3.png',capition:'I been that Kohlis quotes🇮🇳' ,time:'10 min ago' ),
    PostModel(logo: 'assets/image/img.png',name: 'Anushka Sharma',post: 'assets/logo/img_1.png',capition:'I been that Kohlis quotes🇮🇳' ,time:'10 min ago' ),
    PostModel(logo: 'assets/image/img_1.png',name: 'Priyanka Chopra',post: 'assets/image/img_1.png',capition:'I been that Kohlis quotes🇮🇳' ,time:'10 min ago' ),
  ];


  List<SuggerstModel> suggetsList=[
    SuggerstModel(img: 'assets/logo/img_3.png',name: 'kiara advani',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/image/img_1.png',name: 'Priyanka Chopra',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/image/img.png',name: 'Anushka Sharma',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_1.png',name: 'Virat Kohli',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_2.png',name: 'Shubman Gill',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_3.png',name: 'kiara advani',tagline: 'New to instagram'),
  ];


  List savedList=[];

  bool icon=false;
  void changeIcon()
  {
    icon=true;
    notifyListeners();
  }
  void changeIcon1()
  {
    icon=false;
    notifyListeners();
  }


  // String? path;
}