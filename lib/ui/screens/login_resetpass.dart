import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/reset_login_controller.dart';
import 'package:messxp/ui/screen_components/login_resetpass_components.dart';
import 'package:messxp/ui/screen_components/login_screen_components.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class Login_resetpass extends StatelessWidget {
  Login_resetpass({Key? key}) : super(key: key);

  final ResetLoginController controller = Get.put(ResetLoginController());

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: controller.LoginResetFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: screenheight * 0.045,
                  ),
                  logoSection(),
                  appNameSection(),
                  SizedBox(
                    height: screenheight * 0.060,
                  ),
                  SizedBox(
                    height: screenheight * 0.010,
                  ),
                  // user_selection_box(),
                  SizedBox(
                    height: screenheight * 0.025,
                  ),
                  login_reset_textfield(
                      "Phone number or code", controller.emailController),
                  SizedBox(
                    height: screenheight * 0.010,
                  ),
                  login_reset_textfield(
                      "Password", controller.passwordController),
                  SizedBox(
                    height: screenheight * 0.050,
                  ),

                  Obx(() => controller.isLoading.value == true ?
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ),
                  ) : Container()),

                  login_reset_button("Login"),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
