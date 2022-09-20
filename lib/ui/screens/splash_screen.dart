import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:messxp/ui/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/logo/messxplogo.png",
            height: 100,
            width: 100,
          ),
          Text(
            "MessXP",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      // duration: 20,
      nextScreen: Homepage(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
