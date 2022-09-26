import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/create_mess_controller.dart';
import 'package:messxp/ui/screens/dashboard.dart';

Widget continue_button(String butonName, CreateMessController controller) {

  GetStorage _getStorage = GetStorage('app_storage');

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 75,
    ),
    child: SizedBox(
      height: 50,
      width: double.infinity,
      child:    ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          primary: AppColors.defalutColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () async {
          if(controller.address.value == ""){
            Get.snackbar(
              "Error",
              "Provide valid address",
              colorText: Colors.black,
              backgroundColor: Colors.grey,
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else {

            print("mess created ......");

            await _getStorage.write('mess_id', 34321);

            Get.back();

            // Get.to(() => DashBoard());

            // controller.createNewMess();
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
      )
    ),
  );
}

Widget addresstextfield(double screen_width, TextEditingController editingController,CreateMessController controller) {

  return Obx(() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      border: Border.all(
        color: AppColors.defalutColor,
      ),
    ),
    height: 50,
    child:
    Row(
      children: [
        SizedBox(
          width: screen_width * 0.020,
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            controller: editingController,
            style: TextStyle(
              color: Colors.white,
            ),
            onSaved: (value){
              controller.address.value = value.toString();
              print("ddddddddddeeeeebug"+value.toString());
            },
            onChanged: (value){
              controller.address.value = value.toString();
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: controller.address.value == "" ? 'Address' : controller.address.value,
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              editingController.clear();
              controller.address.value = "";
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
                onTap: () async {
                  await controller.getLocation();
                },
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
  ));
}

Widget createmesstextfile(String fieldName,TextEditingController editingController,CreateMessController controller) {


  return TextFormField(
    controller: editingController,
    validator: (Value) {
      return fieldName == 'Mess name'
            ? controller.validateName(Value.toString()) :
            fieldName == 'Owner name' ? controller.validateOwnerName(Value.toString())
          : controller.validateOwnerPhone(Value.toString());
    },
    onSaved: (value) {
      fieldName == 'Mess name'
          ? controller.messName = value.toString()
          : fieldName == 'Owner name'
          ? controller.ownerName = value.toString()
          : controller.ownerPhone = value.toString();
    },
    keyboardType: fieldName == 'Owner phone number' ? TextInputType.phone : TextInputType.text,
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
