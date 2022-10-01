import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ResetLogin extends GetConnect {
  GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic> verifyResetUserLogin(String email, String password) async {
    var userData = new Map();

    userData['email'] = email;
    userData['password'] = password;

    print("errorprovider1 //////////" + userData.toString());

    var response =
        await post("http://172.31.120.238:80/api/user-login", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          await _getStorage.write('token', response.body['token']);
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
