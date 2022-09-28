

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:messxp/provider/dashboard_provider.dart';
import 'package:messxp/ui/screens/homepage.dart';


class DashBoardController extends GetxController {

   GlobalKey<FormState> dashboardFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  // late TextEditingController messIdController;

  GetStorage _getStorage = GetStorage('app_storage');

  var messId = 'mess Id'.obs;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    String? mess_id = await _getStorage.read('mess_id');
    if(mess_id != null){
      messId.value = mess_id;
    }
    else {
      messId.value = 'mess Id';
    }
    // messIdController = TextEditingController(text: messId.toString());
  }

  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // messIdController.dispose();
  }

  String? validateMessId(String value) {
    if (value.length < 1) {
      return "Enter Mess Id";
    }
    return null;
  }

  Future<void> loginWithMessId() async {
    final isValid = dashboardFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      dashboardFromKey.currentState!.save();
    }

    isLoading.value = true;

    var status = await DashBoardProvider().loginWithMessId(messId.toString());
    print("login status ......." +status.toString());

    if ( status== true) {
      isLoading.value = false;
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => Homepage());
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not log in",
        colorText: Colors.black,
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

}