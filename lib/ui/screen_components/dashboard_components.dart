import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';

Widget create_newmess_button(String butonName) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 75,
    ),
    child: SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          primary: AppColors.defalutColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {},
        child: Text(
          butonName,
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
