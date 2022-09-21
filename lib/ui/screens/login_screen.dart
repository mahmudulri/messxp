import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:get/get.dart';
import 'package:messxp/controller/login_controller.dart';
import 'package:messxp/ui/screen_components/login_screen_components.dart';
import 'package:messxp/ui/screens/password_reset.dart';
import 'package:messxp/ui/screens/signup_screen.dart';
import 'package:messxp/ui/widgets/dtext.dart';

enum SingingCharacter { lafayette, jefferson }

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({Key? key}) : super(key: key);

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;

    bool valuefirst = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: controller.LoginFromKey,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PasswordReset());
                      },
                      child: DText(
                        text: "Forget password",
                        color: AppColors.defalutColor,
                      ),
                    ),
                  ),
                  // user_selection_box(),
                  SizedBox(
                    height: screenheight * 0.025,
                  ),
                  logintextfield(
                      "Phone number or code", controller.emailController),
                  SizedBox(
                    height: screenheight * 0.010,
                  ),
                  logintextfield("Password", controller.passwordController),
                  SizedBox(
                    height: screenheight * 0.050,
                  ),

                  login_button("Log in"),
                  SizedBox(
                    height: 10,
                  ),

                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Dont have any account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                          text: 'Open now',
                          style: TextStyle(
                            color: Colors.yellow,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(SignUpScreen());
                            }),
                    ]),
                  ),
                  SizedBox(height: 20.0,),
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
      ),
    );
  }

  Widget user_selection_box() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: AppColors.defalutColor,
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                DText(
                  text: "Manager",
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: AppColors.defalutColor,
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                DText(
                  text: "Member",
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
