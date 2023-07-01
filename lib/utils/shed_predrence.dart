import 'package:shared_preferences/shared_preferences.dart';

class SharClass
{
  Future<void> setData({required String email,required String password})
  async {
    SharedPreferences shar=await SharedPreferences.getInstance();
    shar.setString('e1',email);
    shar.setString('p1',password);
  }


  Future<Map<String, String?>> getData()
  async {
    SharedPreferences shar=await SharedPreferences.getInstance();
    String? sharEmail=shar.getString('e1');
    String? sharPassword=shar.getString('p1');
    return{'email':sharEmail,"pass":sharPassword};
  }
}