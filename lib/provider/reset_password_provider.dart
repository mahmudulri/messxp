import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

class ResetPasswordProvider extends GetConnect {
  Future<dynamic?> doSendMailForResetPassword(String phone) async {
    var userData = new Map();
    userData['phone'] = phone;

    // var response = await post(
    //     "http://172.31.120.238:80/api/user-forgot-password", userData);

    var response =
        await http.post(Uri.parse("http://172.31.120.238:80/api/register"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'phone': userData['phone'],
            }));

    print("errorprovider //////////" + userData.toString());

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      // try {
      //   if (response.body['status'] == 200) {
      //     return true;
      //   }
      // } catch (e) {
      //   print(e.toString());
      // }
    } else {
      return false;
    }
  }
}
