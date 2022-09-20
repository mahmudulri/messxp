import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/registration_controller.dart';
import 'package:messxp/ui/screen_components/login_screen_components.dart';
import 'package:messxp/ui/screen_components/sign_up_screen_components.dart';
import 'package:messxp/ui/screens/login_screen.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegistrationController controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      // appBar: AppBar(
      //   title: Text("Sign UP Screen"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: controller.resgistrationFromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: controller.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.scaffoldColor,
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.070,
                      ),
                      logoSection(),
                      appNameSection(),
                      SizedBox(
                        height: screenHeight * 0.060,
                      ),
                      reg_texfield(
                          "Your name", controller.nameController, controller),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      reg_texfield(
                          "Email", controller.emailController, controller),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      reg_texfield("Phone number",
                          controller.phoneNumberController, controller),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      reg_texfield("Password", controller.passwordController,
                          controller),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      reg_texfield("Confirm Password",
                          controller.confirmPassController, controller),
                      SizedBox(
                        height: screenHeight * 0.030,
                      ),
                      register_button(),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Already have account? ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                              text: 'Login now',
                              style: TextStyle(
                                color: Colors.yellow,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                }),
                        ]),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
