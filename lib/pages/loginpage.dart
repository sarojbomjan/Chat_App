import 'package:chatapp/pages/contact.dart';
import 'package:chatapp/static.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chatlogin extends StatefulWidget {
  const chatlogin({super.key});

  @override
  State<chatlogin> createState() => _chatloginState();
}

class _chatloginState extends State<chatlogin> {
  TextEditingController namecontroller = TextEditingController();

  readfromstorage() async {
    //store in sharef pref
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = await prefs.getString('userid');
    String? username = await prefs.getString("username");
    if (userid != null && username != null) {
      StaticValue.username = username;
      // go to chat page
      gotochatpage();
    }
  }

  gotochatpage() {
    //goto chat
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Conversations()),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    readfromstorage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon // background
            Container(
                height: size.height / 5,
                child: Center(
                    child: Icon(
                  Icons.people,
                  size: 70,
                ))),
            //text
            Container(
              color: Colors.black26,
              width: size.width,
              height: size.height / 10,
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(color: Colors.white)),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  controller: namecontroller,
                  onEditingComplete: () {
                    StaticValue.username = namecontroller.text;
                  },
                ),
              ),
            ),
            //button
            GestureDetector(
              onTap: () async {
                if (namecontroller.text.isEmpty) {
                  // error msg
                } else {
                  String userid =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  FirebaseFirestore.instance
                      .collection('USERS')
                      .doc(userid)
                      .set({'name': namecontroller.text, 'userId': userid});
                  // store in sharef pref
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('userid', userid);
                  await prefs.setString("username", namecontroller.text);

                  //goto chat
                  gotochatpage();
                }
              },
              child: Container(
                height: 55,
                width: 100,
                margin: EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
