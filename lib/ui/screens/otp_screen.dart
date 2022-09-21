import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/otp_controller.dart';
import 'package:messxp/ui/screen_components/otp_screen_components.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);

  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var myheight = MediaQuery.of(context).size.height;

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
            "Verify Phone number",
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
                Image.asset(
                  "assets/images/otp_image.png",
                  height: 200,
                  width: mywidth - 20,
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
                        OtpBox('1'),
                        OtpBox('2'),
                        OtpBox('3'),
                        OtpBox('4'),
                        OtpBox('5'),
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
                verify_button(),
                SizedBox(
                  height: 20,
                ),
                Obx(() => controller.isLoading.value == true ?
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ) : Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
