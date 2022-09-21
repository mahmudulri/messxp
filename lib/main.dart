import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:messxp/ui/route/route.dart';
import 'package:messxp/ui/screen_components/sign_up_screen_components.dart';
import 'package:messxp/ui/screens/create_mess_screen.dart';
import 'package:messxp/ui/screens/dashboard.dart';
import 'package:messxp/ui/screens/login_resetpass.dart';
import 'package:messxp/ui/screens/login_screen.dart';
import 'package:messxp/ui/screens/otp_for_pass.dart';
import 'package:messxp/ui/screens/otp_screen.dart';
import 'package:messxp/ui/screens/password_reset.dart';
import 'package:messxp/ui/screens/set_new_password.dart';
import 'package:messxp/ui/screens/signup_screen.dart';

import 'package:messxp/ui/screens/splash_screen.dart';

void main() async {
  await GetStorage.init('app_storage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: getPages,
        home: Create_Mess());
  }
}
