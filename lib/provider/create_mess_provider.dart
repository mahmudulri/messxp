

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateMessProvider extends GetConnect{

  GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic> createMess(String mess_name, String address,
      String owner_name, String owner_phone) async {
    var userData = new Map();
    userData['mess_name'] = mess_name;
    userData['mess_address'] = address;
    userData['owner_phone'] = owner_phone;
    userData['owner_name'] = owner_name;

    print("user data otp......" + userData.toString());

    var response =
    await post("http://172.31.120.238:80/api/create-mess", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("errorafterhit //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
           await _getStorage.write('mess_id', response.body['mess_info']['mess_id']);
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