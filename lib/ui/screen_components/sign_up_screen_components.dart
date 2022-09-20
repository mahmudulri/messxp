import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:crypto/crypto.dart';
import 'package:messxp/controller/registration_controller.dart';

//...............Registration text field
Widget reg_texfield(String fieldName, TextEditingController controller,
    RegistrationController registrationController) {
  return TextFormField(
    onSaved: (value) {
      fieldName == 'Your name'
          ? registrationController.name = value.toString()
          : fieldName == 'Email'
              ? registrationController.email = value.toString()
              : fieldName == 'Phone number'
                  ? registrationController.phone = value.toString()
                  : fieldName == 'Password'
                      ? registrationController.password =
                          (sha1.convert(utf8.encode(value!))).toString()
                      : registrationController.confirmPassword =
                          (sha1.convert(utf8.encode(value!))).toString();
    },
    validator: (value) {
      return fieldName == 'Your name'
          ? registrationController.validateName(value!.toString())
          : fieldName == 'Email'
              ? registrationController.validateEmail(value!.toString())
              : fieldName == 'Phone number'
                  ? registrationController.validatePhone(value!.toString())
                  : fieldName == 'Password'
                      ? registrationController
                          .validatePassword(value!.toString())
                      : registrationController
                          .validateConfirmPassword(value!.toString());
    },
    controller: controller,
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

Widget register_button() {
  final RegistrationController controller = Get.put(RegistrationController());
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
          controller.checkRegistration();
        },
        child: Text(
          'Register',
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
