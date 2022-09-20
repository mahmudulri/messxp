import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

class SetNewPassProvider extends GetConnect {
  GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic> setNewPassword(
    String newPass,
    String newRePass,
  ) async {
    final int? emp_id = await _getStorage.read('employee_id');

    var userData = new Map();
    userData['user_id'] = emp_id;
    userData['new_password'] = newPass;
    userData['re_type_password'] = newRePass;

    print("user data otp......" + userData.toString());

    var response = await post(
        "http://172.31.120.238:80/api/change-user-forgot-password", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());
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
