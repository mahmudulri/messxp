

import 'package:get/get.dart';

class DashBoardProvider extends GetConnect {


  Future<dynamic> loginWithMessId(String mess_id) async {
    var userData = new Map();
    userData['mess_id'] = mess_id.toString();

    print("user data otp......" + userData.toString());

    var response =
    await post("http://172.31.120.238:80/api/login-with-mess-id", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}