import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/reset_login_provider.dart';
import '../ui/screens/homepage.dart';

class ResetLoginController extends GetxController {
  GlobalKey<FormState> LoginResetFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (value.length < 1) {
      return "Enter Valid Mail";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  Future<void> checkLogin() async {
    final isValid = LoginResetFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      LoginResetFromKey.currentState!.save();
    }

    isLoading.value = true;

    var logInStatus = await ResetLogin().verifyResetUserLogin(email, password);
    print("login status ......." + logInStatus.toString());
    isLoading.value = false;
    if (logInStatus == true) {
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => Homepage());
    } else {
      // Fluttertoast.showToast(msg:"ENTER VALID INFORMATION",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: greyText);
      print("error...........");
    }
  }
}
