import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DraftPage extends StatefulWidget {
  const DraftPage({Key? key}) : super(key: key);

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  Future<void> insertrecord() async {
    // ignore: unrelated_type_equality_checks
    if (name.text == " " || email.text == "" || password.text == "") {
      try {
        String uri = "http://172.31.120.238:80/api/register";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "phone": phone.text,
          "password": password.text,
          "confirm_password": confirmpassword.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("submitted");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Fill all data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(
                hintText: "Phone",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmpassword,
              decoration: InputDecoration(
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      insertrecord();
                    },
                    child: Text("Submit Data"))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
