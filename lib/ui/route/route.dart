import 'package:get/get.dart';
import 'package:messxp/ui/screens/login_screen.dart';

import 'package:messxp/ui/screens/splash_screen.dart';

const String splash = '/splash-screen';
const String signup = '/sign-up-screen';
const String login = '/sign-in-screen';

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: login,
    page: () => LogIn_Screen(),
  ),
];
