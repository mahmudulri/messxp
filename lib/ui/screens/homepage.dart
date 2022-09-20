import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get_storage/get_storage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mess Xp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/messxplogo.png",
              height: 100,
              width: 100,
            ),

            Text("User id : "),
            Text("Email address : "),
            Text("Token: " + getToken().toString())
            // AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText(
            //       'MessXP',
            //       textStyle: const TextStyle(
            //         fontSize: 32.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       speed: const Duration(milliseconds: 2000),
            //     ),
            //   ],
            //   totalRepeatCount: 4,
            //   pause: const Duration(milliseconds: 1000),
            //   displayFullTextOnTap: true,
            //   stopPauseOnTap: true,
            // )
          ],
        ),
      ),
    );
  }

  Future<String?> getToken() async {
    GetStorage _getStorage = GetStorage('app_storage');
    final String? token = await _getStorage.read('token');
    print(token.toString());
    return token;
  }
}
