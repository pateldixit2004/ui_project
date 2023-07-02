import 'package:flutter/material.dart';
import 'package:ui_project/utils/shed_predrence.dart';

class ReginterScreen extends StatefulWidget {
  const ReginterScreen({Key? key}) : super(key: key);

  @override
  State<ReginterScreen> createState() => _ReginterScreenState();
}

class _ReginterScreenState extends State<ReginterScreen> {
  TextEditingController txtemail =TextEditingController();
  TextEditingController txtpassword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue),borderRadius: BorderRadius.circular(10)),
                  label: Text("Email"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtpassword,

                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue),borderRadius: BorderRadius.circular(10)),
                  label: Text("Password"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),


            ElevatedButton(onPressed: () {

              String? email= txtemail.text;
              String? password= txtpassword.text;

              SharClass shars =SharClass();
              shars.setData(email: email, password: password,login: true);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success lsign up ")));
              Navigator.pushReplacementNamed(context, '/');
            }, child: Text("Register")),
            // ElevatedButton(onPressed: () {
            //
            //   String? email= txtemail.text;
            //   String? password= txtpassword.text;
            //
            //
            // }, child: Text("Dont hve accoum")),
          ],
        ),
      ),
    ),);
  }
}
