import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';

Widget continue_button(String butonName) {
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

Widget addresstextfield(double screen_width, TextEditingController) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      border: Border.all(
        color: AppColors.defalutColor,
      ),
    ),
    height: 50,
    child: Row(
      children: [
        SizedBox(
          width: screen_width * 0.020,
        ),
        Expanded(
          flex: 5,
          child: TextField(
            controller: TextEditingController,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Address',
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              TextEditingController.clear();
              print("Deleted");
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: AppColors.defalutColor,
            ),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget createmesstextfile(String fieldName) {
  return TextFormField(
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
