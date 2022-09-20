import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:crypto/crypto.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/setnewpassword_controller.dart';

Widget new_passtextfield(
    String fieldtype, TextEditingController editController) {
  final SetNewPasswordController controller =
      Get.put(SetNewPasswordController());
  return TextFormField(
    controller: editController,
    validator: (Value) {
      return fieldtype == 'New password'
          ? controller.validatePassword(Value.toString())
          : controller.validateConfirmPassword(Value.toString());
    },
    onSaved: (value) {
      fieldtype == 'New password'
          ? controller.password = (sha1.convert(utf8.encode(value!))).toString()
          : controller.confirmPassword =
              (sha1.convert(utf8.encode(value!))).toString();
    },
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: fieldtype,
    ),
  );
}

Widget changepass_button() {
  final SetNewPasswordController controller =
      Get.put(SetNewPasswordController());
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
          controller.resetNewPassword();
        },
        child: Text(
          'Change Password',
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
