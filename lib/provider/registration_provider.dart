import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider extends GetConnect {
  GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic?> doRegistration(String name, String email, String phone,
      String password, String confirmPassword) async {
    var userData = new Map();
    userData['name'] = name;
    userData['email'] = email;
    userData['phone'] = phone;
    userData['password'] = password;
    userData['confirm_password'] = confirmPassword;

    var response =
        await post("http://172.31.120.238:80/api/register", userData);

    // var response =
    //     await http.post(Uri.parse("http://172.31.120.238:80/api/register"),
    //         headers: <String, String>{
    //           'Content-Type': 'application/json; charset=UTF-8',
    //         },
    //         body: jsonEncode(<String, String>{
    //           'name': userData['name'],
    //           'email': userData['email'],
    //           'phone': userData['phone'],
    //           'password': userData['password'],
    //           'confirm_password': userData['confirm_password'],
    //         }));

    print("errorprovider //////////" + userData.toString());

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          print("bodystatus //////////" + response.body['status'].toString());
          var emp_id = response.body['emailotp']['user_id'];

          print("resgistration credential ......." + emp_id.toString());
          await saveLogInTokenAndEmployeeId(emp_id);
          return true;
        }
      } catch (e) {
        print(e.toString());
      }

      //  return response.body;
    } else {
      return false;
    }
  }

  saveLogInTokenAndEmployeeId(int employeeId) async {
    await _getStorage.write('employee_id', employeeId);
    final int? emp_id = await _getStorage.read('employee_id');
    print('login provider' + emp_id!.toString());
    return true;
  }
}
