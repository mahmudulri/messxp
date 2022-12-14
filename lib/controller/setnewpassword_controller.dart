import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:messxp/provider/setnewpassword_provider.dart';
import 'package:messxp/ui/screens/login_resetpass.dart';
import 'package:messxp/ui/screens/login_screen.dart';

class SetNewPasswordController extends GetxController {
  GlobalKey<FormState> setNewPasswordFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  late TextEditingController passwordController, confirmPassController;

  String password = '';
  String confirmPassword = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  Future<void> resetNewPassword() async {
    final isValid = setNewPasswordFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      setNewPasswordFromKey.currentState!.save();
    }

    isLoading.value = true;

    var logInStatus =
        await SetNewPassProvider().setNewPassword(password, confirmPassword);
    print("login status ......." + logInStatus.toString());
    isLoading.value = false;
    if (logInStatus == true) {
      // Fluttertoast.showToast(
      //     msg: "PASSWORD UPDATED",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.grey);
      Get.to(() => Login_resetpass());
    } else {
      // Fluttertoast.showToast(msg:"ENTER VALID INFORMATION",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: greyText);
      // print("error...........");
    }
  }
}
