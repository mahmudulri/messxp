import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/controller/otp_controller.dart';
import 'package:messxp/ui/screen_components/otp_for_pass_components.dart';
import 'package:messxp/ui/screen_components/otp_screen_components.dart';
import 'package:messxp/ui/widgets/dtext.dart';

import '../../const/app_colors.dart';

class OtpForPassword extends StatelessWidget {
  const OtpForPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    final OtpController controller = Get.put(OtpController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Verify Phone number(2nd OTP)",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Ubuntu",
              fontSize: 12,
            ),
          ),
        ),
        // backgroundColor: AppColors.scaffoldColor,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                controller.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.scaffoldColor,
                        ),
                      )
                    : Container(),
                Image.asset(
                  "assets/images/otp_image.png",
                  height: 200,
                  width: screenwidth - 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 40,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "An 5 digits code has been sent to your phone number or email",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 10,
                      color: Color(0xff828282),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                    key: controller.otpFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpBoxforpassreset('1'),
                        OtpBoxforpassreset('2'),
                        OtpBoxforpassreset('3'),
                        OtpBoxforpassreset('4'),
                        OtpBoxforpassreset('5'),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    DText(
                      text: "Did not get OTP?",
                      fontSize: 14,
                    ),
                    Text(
                      "  Resend now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                verify_password_button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
