import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/reset_password_controller.dart';
import 'package:messxp/ui/screen_components/otp_screen_components.dart';
import 'package:messxp/ui/screen_components/password_reset_components.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    final ResetPasswordController controller =
        Get.put(ResetPasswordController());

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
            "Password reset",
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
                    "Enter Your phone number",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: mywidth * 0.060,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight * 0.015,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "An 5 digits code has been sent to your email address",
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
                    key: controller.resetPasswordFromKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                        controller: controller.phoneNumberController,
                        validator: (Value) {
                          return controller.validatePhone(Value.toString());
                        },
                        onSaved: (value) {
                          controller.phone = value.toString();
                        },
                        keyboardType: TextInputType.phone)),
                SizedBox(
                  height: 20,
                ),
                send_otp_button(context),
                SizedBox(
                  height: 10,
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
