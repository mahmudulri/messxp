import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/provider/reset_password_provider.dart';
import 'package:messxp/ui/screens/otp_for_pass.dart';
import 'package:messxp/ui/screens/set_new_password.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> resetPasswordFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  late TextEditingController phoneNumberController;

  var phone = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    phoneNumberController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneNumberController.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 11 || value.length > 11) {
      return "Phone number must be of 11 characters";
    }
    return null;
  }

  Future<void> sendMailForPasswordOtp() async {
    final isValid = resetPasswordFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      resetPasswordFromKey.currentState!.save();
    }

    isLoading.value = true;

    var status =
        await ResetPasswordProvider().doSendMailForResetPassword(phone);
    print("login status ......." + status.toString());

    if (status == true) {
      // Get.offAndToNamed(Routes.HOME);
      isLoading.value = false;
      Get.to(() => OtpForPassword());
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Something wrong !! Could not sent otp ...",
        colorText: Colors.black,
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
      );

    }
  }
}
