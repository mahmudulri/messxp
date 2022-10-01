import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/ui/screens/create_mess_screen.dart';

Widget create_newmess_button(String butonName, update) {
  return Padding(
    padding: EdgeInsets.only(
      left: 35,
      right: 35
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
        onPressed: ()  async {
           var r =  await Get.to(Create_Mess());

           if(r != null){
             update;
           }
        },
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
