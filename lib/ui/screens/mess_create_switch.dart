import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/ui/screen_components/mess_create_switch_components.dart';

class MessCreateSwitch extends StatelessWidget {
  const MessCreateSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: screen_height * 0.130,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Enter into a mess to continue",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.020,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  "Please ensure you are being involve in an existing mess",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.030,
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
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.010,
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
                height: 50,
                width: screen_width - 150,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: '_ _ _ _ _ _ _',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              )),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          color: AppColors.defalutColor,
                        ),
                        child: Center(
                            child: Text(
                          "Continue",
                          style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screen_height * 0.040,
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
              create_newmess_button("+ Create New mess")
            ],
          ),
        ),
      ),
    );
  }
}
