import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/setnewpassword_controller.dart';
import 'package:messxp/ui/screen_components/set_new_pass_components.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    final SetNewPasswordController controller =
        Get.put(SetNewPasswordController());

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
            "Set new Password",
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
                    "An 4 digits code has been sent to your email address",
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
                  key: controller.setNewPasswordFromKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      new_passtextfield(
                          "New password", controller.passwordController),
                      new_passtextfield("re-type your new password",
                          controller.confirmPassController),
                    ],
                  ),
                ),
                controller.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.scaffoldColor,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                changepass_button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
