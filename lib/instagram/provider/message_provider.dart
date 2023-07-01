import 'package:flutter/cupertino.dart';

import '../model/messgeModel.dart';

class MessageProvider extends ChangeNotifier
{
  String? path;
  bool txtserch=false;
  void vis()
  {
    true;
    notifyListeners();
  }

  changeImagePath(MessgeModel messgeModel,int index)
  {

    itemList[index]=messgeModel;
    notifyListeners();
  }



  List<MessgeModel> itemList=[
    MessgeModel(img: '',name:'your story',link: ''),
    MessgeModel(img: '',name:'Anushka Sharma',link: 'www.instagram.com/anushkasharma/'),
    MessgeModel(img: '',name:'Virat Kohli',link: 'www.instagram.com/virat.kohli/?hl=en'),
    MessgeModel(img: '',name:'Priyanka Chopra',link: 'www.instagram.com/priyankachopra/?hl=en'),
    MessgeModel(img: '',name:'Ratan Tata',link: 'www.instagram.com/ratantata/?hl=en'),
    MessgeModel(img: '',name:'Mukesh Ambani  ',link: 'www.ril.com/OurCompany/'),
    MessgeModel(img: '',name:'Kiara Advani ',link: 'www.instagram.com/kiaraaliaadvani/'),
    MessgeModel(img: '',name:'Shubman Gill  ',link: 'www.instagram.com/shubmangill/?hl=en'),
  ];

  List<MessgeModel> imgList=[
    MessgeModel(img: 'assets/image/dixit.jpg',name:'your story',link: ''),
    MessgeModel(img: 'assets/image/img.png',name:'Anushka Sharma',link: 'www.instagram.com/anushkasharma/'),
    MessgeModel(img: 'assets/logo/img_1.png',name:'Virat Kohli',link: 'www.instagram.com/virat.kohli/?hl=en'),
    MessgeModel(img: 'assets/image/img_1.png',name:'Priyanka Chopra',link: 'www.instagram.com/priyankachopra/?hl=en'),
    MessgeModel(img: 'assets/image/img_2.png',name:'Ratan Tata',link: 'www.instagram.com/ratantata/?hl=en'),
    MessgeModel(img: 'assets/image/img_3.png',name:'Mukesh Ambani  ',link: 'www.ril.com/OurCompany/Leadership/Mukesh-Ambani-Chairman-and-Managing-Director.aspx'),
    MessgeModel(img: 'assets/logo/img_3.png',name:'Kiara Advani ',link: 'www.instagram.com/kiaraaliaadvani/'),
    MessgeModel(img: 'assets/logo/img_2.png',name:'Shubman Gill  ',link: 'www.instagram.com/shubmangill/?hl=en'),
  ];



  List<MessgeModel> list1=[];
  List<MessgeModel> serchList=[];
  void  serchName(String serch)
  {
    if(serch.isEmpty)
      {
        list1=List.from(itemList);
      }
    else
      {
        serchList.clear();
        for(var c in itemList)
          {
            if(c.name!.toLowerCase().contains(serch.toLowerCase()))
              {
                serchList.add(c);
              }
          }
        list1=List.from(serchList);
      }
    notifyListeners();
  }
}