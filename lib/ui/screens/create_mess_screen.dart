import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/ui/screen_components/create_mess_screen_components.dart';

import '../../controller/create_mess_controller.dart';

class Create_Mess extends StatefulWidget {
  const Create_Mess({Key? key}) : super(key: key);

  @override
  State<Create_Mess> createState() => _Create_MessState();
}

class _Create_MessState extends State<Create_Mess> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;

    final CreateMessController controller = Get.put(CreateMessController());

    var _checked = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Obx(() => Form(
                key: controller.messFromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screen_width * 0.040,
                    ),
                    Text(
                      "Create a new mess",
                      style: TextStyle(
                        color: Colors.white,
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
                     createmesstextfile("Mess name",controller.messController,controller),
                    SizedBox(
                      height: screen_width * 0.020,
                    ),
                    addresstextfield(screen_width,controller.addressController,controller),
                    SizedBox(
                      height: screen_height * 0.010,
                    ),
                    Container(
                      height: screen_height * 0.250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.defalutColor.withOpacity(0.40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screen_height * 0.019,
                            left: screen_height * 0.019
                        ),
                        child: Text(
                            controller.address.value.toString()
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screen_width * 0.040,
                    ),
                    createmesstextfile("Owner name",controller.ownerNameController,controller),
                    SizedBox(
                      height: screen_width * 0.040,
                    ),
                    createmesstextfile("Owner phone number",controller.ownerPasswordController,controller),
                    SizedBox(
                      height: screen_height * 0.010,
                    ),
                    Checkbox(
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                            print(_value);
                          });
                        }),
                    continue_button("Continue",controller),
                    SizedBox(height: screen_height * 0.010,),
                    controller.isLoading.value == true ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueGrey,
                      ),
                    ) : Container()
                  ],
                ),
              ),)
            ),
          ),
        ),
      ),
    );
  }
}
