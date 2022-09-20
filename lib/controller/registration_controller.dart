import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:messxp/provider/registration_provider.dart';
import 'package:messxp/ui/screens/otp_screen.dart';

class RegistrationController extends GetxController {
  GetStorage _getStorage = GetStorage('app_storage');

  GlobalKey<FormState> resgistrationFromKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  late TextEditingController nameController,
      emailController,
      phoneNumberController,
      passwordController,
      confirmPassController;
  String name = '';
  var email = '';
  var phone = '';
  var password = '';
  var confirmPassword = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  String? validateName(String value) {
    if (value.length < 1) {
      return "Enter Valid Name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.length < 1) {
      return "Enter Valid Mail";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length < 11 || value.length > 11) {
      return "Phone number must be of 11 characters";
    }
    return null;
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

  Future<void> checkRegistration() async {
    final isValid = resgistrationFromKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      resgistrationFromKey.currentState!.save();
    }

    isLoading.value = true;

    var logInStatus = await RegistrationProvider()
        .doRegistration(name, email, phone, password, confirmPassword);
    print("login status ......." + logInStatus.toString());
    isLoading.value = false;
    if (logInStatus == true) {
      // Get.offAndToNamed(Routes.HOME);
      Get.to(() => OtpScreen());
    } else {
      // Fluttertoast.showToast(msg:"ENTER VALID INFORMATION",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: greyText);
      // print("error...........");
    }
  }
}
