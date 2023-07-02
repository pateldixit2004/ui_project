import 'package:shared_preferences/shared_preferences.dart';

class SharClass
{
  Future<void> setData({required String email,required String password,required bool login})
  async {
    SharedPreferences shar=await SharedPreferences.getInstance();
    shar.setString('e1',email);
    shar.setString('p1',password);
    shar.setBool('ulogin', login);
  }


  Future<Map<dynamic, dynamic?>> getData()
  async {
    SharedPreferences shar=await SharedPreferences.getInstance();
    String? sharEmail=shar.getString('e1');
    String? sharPassword=shar.getString('p1');
    bool? sharlogin=shar.getBool('ulogin');
    return{'email':sharEmail,"pass":sharPassword,'login': sharlogin};
    // return {'gname':sharEmail,'gemail':sharPassword,'getted':login};

  }
}