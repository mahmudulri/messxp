import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/const/app_string.dart';

import 'package:messxp/ui/screen_components/create_mess_screen_components.dart';
import 'package:messxp/ui/screens/draft.dart';

class Create_Mess extends StatefulWidget {
  // const Create_Mess({Key? key}) : super(key: key);

  @override
  State<Create_Mess> createState() => _Create_MessState();
}

class _Create_MessState extends State<Create_Mess> {
  TextEditingController addressfield = TextEditingController();

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;

    // var _checked = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screen_width * 0.040,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create a new mess",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: screen_width * 0.010,
                ),
                Text(
                  "Please provide the necessery information to create a new mess",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screen_width * 0.040,
                ),
                createmesstextfile("Mess name"),
                SizedBox(
                  height: screen_width * 0.020,
                ),
                addresstextfield(screen_width, addressfield),
                SizedBox(
                  height: screen_height * 0.010,
                ),
                Container(
                  height: screen_height * 0.250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.defalutColor.withOpacity(0.40),
                  ),
                ),
                SizedBox(
                  height: screen_width * 0.040,
                ),
                createmesstextfile("Address"),
                SizedBox(
                  height: screen_width * 0.040,
                ),
                createmesstextfile("Owner name"),
                SizedBox(
                  height: screen_width * 0.040,
                ),
                createmesstextfile("Owner name"),
                SizedBox(
                  height: screen_width * 0.040,
                ),
                createmesstextfile("Owner name"),
                SizedBox(
                  height: screen_height * 0.010,
                ),
                Mycheckbox(),
                continue_button(
                  "Continue",
                ),
                SizedBox(
                  height: screen_height * 0.020,
                ),
                InkWell(
                  onTap: () {
                    Get.to(Draftpage());
                  },
                  child: Container(
                    height: screen_height * 0.055,
                    width: screen_width * 0.20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.defalutColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Skip".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.010,
                ),
                Text(
                  "waring".toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.010,
                ),
                Text(
                  warning_text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
