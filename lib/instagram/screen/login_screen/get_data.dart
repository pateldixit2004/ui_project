import 'package:flutter/material.dart';
import 'package:ui_project/utils/shed_predrence.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: txtemail,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue),borderRadius: BorderRadius.circular(10)),
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(10),
                )
              ),

            ),
            SizedBox(height: 10,),
            TextField(
              controller: txtpassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue),borderRadius: BorderRadius.circular(10)),
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(10),
                )
              ),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {

              String? email=txtemail.text;
              String? password=txtpassword.text;
              SharClass shar =SharClass();
              Map m1= await shar.getData();
              if(m1['email']==email && m1['pass']==password)
                {
                  Navigator.pushNamed(context,'home');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login")));
                }
              else
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wrong")));

              }

            }, child: Text("Login"),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {

                  Navigator.pushNamed(context, 're');
                }, child: Text("Don't have account ?")),
                Text("sing in"),
              ],
            )
          ],
        ),
      ),
    ),);
  }

}
