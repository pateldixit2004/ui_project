import 'package:flutter/cupertino.dart';

import '../../model/profile_model.dart';
import '../../model/suggesst_model.dart';

class ProfileProvider extends ChangeNotifier
{
  List<ProfileModel> helightList=[
    ProfileModel(img: 'assets/image/dixit.jpg',name:'Dixit',),
    ProfileModel(img: 'assets/image/img.png',name:'Anushka Sharma',),
    ProfileModel(img: 'assets/logo/img_1.png',name:'Virat Kohli', ),
    ProfileModel(img: 'assets/image/img_1.png',name:'Priyanka Chopra', ),
    ProfileModel(img: 'assets/image/img_2.png',name:'Ratan Tata', ),
    ProfileModel(img: 'assets/image/img_3.png',name:'Mukesh Ambani  ', ),
    ProfileModel(img: 'assets/logo/img_3.png',name:'Kiara Advani ', ),
    ProfileModel(img: 'assets/logo/img_2.png',name:'Shubman Gill  ', ),

  ];

  List<SuggerstModel> suggetsList=[
    SuggerstModel(img: 'assets/logo/img_3.png',name: 'kiara advani',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/image/img_1.png',name: 'Priyanka Chopra',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/image/img.png',name: 'Anushka Sharma',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_1.png',name: 'Virat Kohli',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_2.png',name: 'Shubman Gill',tagline: 'New to instagram'),
    SuggerstModel(img: 'assets/logo/img_3.png',name: 'kiara advani',tagline: 'New to instagram'),
  ];



  bool i=true;
}