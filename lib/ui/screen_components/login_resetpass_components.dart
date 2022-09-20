import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/login_controller.dart';
import 'package:messxp/controller/reset_login_controller.dart';
import 'package:messxp/ui/screens/homepage.dart';
import 'package:messxp/ui/widgets/dtext.dart';

//.............App logo

Widget login_reset_textfield(
    String fieldName, TextEditingController editingController) {
  ResetLoginController controller = Get.put(ResetLoginController());

  return TextFormField(
    controller: editingController,
    validator: (Value) {
      return fieldName == 'Phone number or code'
          ? controller.validatePassword(Value.toString())
          : controller.validateEmail(Value.toString());
    },
    onSaved: (value) {
      fieldName == 'Phone number or code'
          ? controller.email = value.toString()
          : controller.password =
              (sha1.convert(utf8.encode(value!))).toString();
    },
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.defalutColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: AppColors.defalutColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: AppColors.defalutColor),
      ),
      hintText: fieldName,
      hintStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

// Login button for login screen for password reset

Widget login_reset_button(String butonName) {
  ResetLoginController controller = Get.put(ResetLoginController());

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
    ),
    child: SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.defalutColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          controller.checkLogin();
        },
        child: Text(
          butonName,
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
