import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/otp_controller.dart';

Widget verify_password_button() {
  final OtpController controller = Get.put(OtpController());
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
          controller.checkOtpVerificationforPassword();
        },
        child: Text(
          'Verify',
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

class OtpBoxforpassreset extends StatelessWidget {
  late String digitNo;

  OtpBoxforpassreset(String serialNo) {
    digitNo = serialNo;
  }
  final OtpController controller = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1,
            )),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (value) {
              digitNo == '1'
                  ? controller.digit1 = value.toString()
                  : digitNo == '2'
                      ? controller.digit2 = value.toString()
                      : digitNo == '3'
                          ? controller.digit3 = value.toString()
                          : digitNo == '4'
                              ? controller.digit4 = value.toString()
                              : controller.digit5 = value.toString();
            },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }
}
