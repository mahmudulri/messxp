import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/reset_password_controller.dart';

Widget send_otp_button(BuildContext context) {
  var screenheight = MediaQuery.of(context).size.height;

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
    ),
    child: SizedBox(
      height: screenheight * 0.050,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.defalutColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          controller.sendMailForPassewordOtp();
        },
        child: Text(
          'Send',
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
