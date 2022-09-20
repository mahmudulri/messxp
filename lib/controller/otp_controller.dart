import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:messxp/provider/otp_provider.dart';
import 'package:messxp/ui/screens/login_screen.dart';
import 'package:messxp/ui/screens/set_new_password.dart';

class OtpController extends GetxController {
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  String digit1 = '';
  String digit2 = '';
  String digit3 = '';
  String digit4 = '';
  String digit5 = '';

  Future<void> checkOtpVerification() async {
    otpFormKey.currentState!.save();

    isLoading.value = true;

    var otpVerificationStatus =
        await OtpProvider().verifyOtp(digit1, digit2, digit3, digit4, digit5);
    print("login status ......." + otpVerificationStatus.toString());
    isLoading.value = false;
    if (otpVerificationStatus == true) {
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => LogIn_Screen());
    } else {
      // Fluttertoast.showToast(msg:"ENTER VALID INFORMATION",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: greyText);
      // print("error...........");
    }
  }

  Future<void> checkOtpVerificationforPassword() async {
    otpFormKey.currentState!.save();

    isLoading.value = true;

    var otpVerificationStatus = await OtpProvider()
        .verifyOtpforPassword(digit1, digit2, digit3, digit4, digit5);
    print("login status ......." + otpVerificationStatus.toString());
    isLoading.value = false;
    if (otpVerificationStatus == true) {
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => SetNewPassword());
    } else {
      // Fluttertoast.showToast(msg:"ENTER VALID INFORMATION",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: greyText);
      // print("error...........");
    }
  }
}
