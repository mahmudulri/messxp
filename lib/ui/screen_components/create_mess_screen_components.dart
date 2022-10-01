import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';

import 'package:get/get.dart';
import 'package:messxp/const/app_colors.dart';

bool _value = false;

// class Demobutton extends StatefulWidget {
//   final String mybuttonName;
//   Demobutton({required this.mybuttonName});

//   @override
//   State<Demobutton> createState() => _DemobuttonState();
// }

// class _DemobuttonState extends State<Demobutton> {
//   bool mycolor = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 75,
//       ),
//       child: SizedBox(
//         height: 50,
//         width: double.infinity,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             primary: AppColors.defalutColor, // background
//             onPrimary: Colors.white, // foreground
//           ),
//           onPressed: () {
//             setState(() {
//               mycolor = !mycolor;
//             });
//             print(mycolor);
//           },
//           child: Text(
//             widget.mybuttonName,
//             style: TextStyle(
//               fontFamily: "Ubuntu",
//               color: mycolor ? Colors.green : Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Mycheckbox extends StatefulWidget {
  @override
  State<Mycheckbox> createState() => _MycheckboxState();
}

class _MycheckboxState extends State<Mycheckbox> {
  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.defalutColor,
              ),
              height: 35,
              width: 35,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _value = !_value;
                });
                print(_value);
              },
              child: Container(
                decoration: BoxDecoration(
                  // color: _value ? Colors.purple : Colors.white,
                  color: _value ? AppColors.defalutColor : Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          width: screen_width * .020,
        ),
        Text(
          "I've checked and ensured",
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

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
        onPressed: () {
          _value
              ? Get.defaultDialog(
                  title: "",
                  content: Text("Success"),
                )
              : Get.defaultDialog(
                  title: " ",
                  content: Text("Please confirm the box"),
                );

          print(_value);
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

// Widget checkbox_section(double screen_width) {
//   return Row(
//     children: [
//       Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: AppColors.defalutColor,
//             ),
//             height: 35,
//             width: 35,
//           ),
//           InkWell(
//             onTap: () {
//               _value = !_value;
//               print(_value);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 // color: _value ? Colors.purple : Colors.white,
//                 color: _value ? Colors.purple : Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//               ),
//               height: 20,
//               width: 20,
//             ),
//           ),
//         ],
//       ),
//       SizedBox(
//         width: screen_width * .020,
//       ),
//       Text(
//         "I've checked and ensure that, the provide information is correct",
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       )
//     ],
//   );
// }

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
