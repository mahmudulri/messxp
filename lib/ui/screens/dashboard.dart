import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/controller/dashboard_controller.dart';
import 'package:messxp/ui/screen_components/dashboard_components.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;

    final DashBoardController controller = Get.put(DashBoardController());


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Obx(() => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screen_height * 0.130,
                ),
                Text(
                  "Enter into a mess to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: screen_height * 0.028,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.020,
                ),
                Text(
                  "Please ensure you are being involve in an existing mess",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: screen_height * 0.017,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.040,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mess ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Ubuntu",
                        fontSize: screen_height * 0.025,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.020,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: AppColors.defalutColor,
                    ),
                  ),
                  height: screen_height * 0.065,
                  width: screen_width - 80,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screen_height * 0.005
                          ),
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Form(
                            key: controller.dashboardFromKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screen_height * 0.010
                              ),
                              child: TextFormField(
                                initialValue: controller.messId.value,

                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                onSaved: (value){
                                  controller.messId.value = value.toString();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // hintText: '_ _ _ _ _ _ _',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            color: AppColors.defalutColor,
                          ),
                          child: Center(
                              child: GestureDetector(
                                onTap: (){
                                  if(controller.messId == "mess Id"){
                                    Get.snackbar(
                                      "Error",
                                      "Provide valid Mess Id",
                                      colorText: Colors.black,
                                      backgroundColor: Colors.grey,
                                      snackPosition: SnackPosition.BOTTOM,

                                    );
                                  }
                                 else {
                                   controller.loginWithMessId();
                                  }
                                },
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.060,
                ),
                Text(
                  "Don't have mess? create new",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.030,
                ),
                create_newmess_button("+ Create New mess"),
                SizedBox(
                  height: screen_height * 0.030,
                ),
                controller.isLoading.value == true ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ) : Container()
              ],
            ),
          )),
        ),
      ),
    );
  }
}
