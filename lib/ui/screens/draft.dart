import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Draftpage extends StatefulWidget {
  @override
  State<Draftpage> createState() => _DraftpageState();
}

class _DraftpageState extends State<Draftpage> {
  // const Draftpage({Key? key}) : super(key: key);
  bool myvalue = false;

  // @override
  // void initState() {
  //   super.initState();
  //   custom_alert();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      mydilog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "USER Dashboard",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          InkWell(
            onTap: () {
              mydilog();
              // showGeneralDialog(
              //     context: context,
              //     barrierDismissible: true,
              //     barrierLabel: MaterialLocalizations.of(context)
              //         .modalBarrierDismissLabel,
              //     barrierColor: Colors.black45,
              //     transitionDuration: const Duration(milliseconds: 200),
              //     pageBuilder: (BuildContext buildContext, Animation animation,
              //         Animation secondaryAnimation) {
              //       return Center(
              //         child: Container(
              //           width: MediaQuery.of(context).size.width,
              //           height: MediaQuery.of(context).size.height,
              //           padding: EdgeInsets.all(20),
              //           color: Colors.white,
              //           child: Column(
              //             children: [
              //               SizedBox(
              //                 height: 200,
              //               ),
              //               Text(
              //                 " Mahmudul hasan",
              //                 style: TextStyle(
              //                   decoration: TextDecoration.none,
              //                   color: Colors.black,
              //                   fontSize: 12,
              //                 ),
              //               ),
              //               ElevatedButton(
              //                 onPressed: () {
              //                   Navigator.of(context).pop();
              //                 },
              //                 child: Text(
              //                   "Save",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     });

              // showGeneralDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   transitionDuration: Duration(milliseconds: 500),
              //   transitionBuilder:
              //       (context, animation, secondaryAnimation, child) {
              //     return FadeTransition(
              //       opacity: animation,
              //       child: ScaleTransition(
              //         scale: animation,
              //         child: child,
              //       ),
              //     );
              //   },
              //   pageBuilder: (context, animation, secondaryAnimation) {
              //     return SafeArea(
              //       child: Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height,
              //         padding: EdgeInsets.all(20),
              //         color: Colors.white,
              //         child: Center(
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: <Widget>[
              //               Text(
              //                 'Hai This Is Full Screen Dialog',
              //                 style: TextStyle(
              //                   fontFamily: "Ubuntu",
              //                   color: Colors.black,
              //                   fontSize: 20.0,
              //                   decoration: TextDecoration.none,
              //                 ),
              //               ),
              //               ElevatedButton(
              //                 onPressed: () {
              //                   Navigator.of(context).pop();
              //                 },
              //                 child: Text(
              //                   "DISMISS",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // );

              // showGeneralDialog(
              //     context: context,
              //     barrierDismissible: true,
              //     barrierLabel: MaterialLocalizations.of(context)
              //         .modalBarrierDismissLabel,
              //     barrierColor: Colors.black,
              //     transitionDuration: Duration(microseconds: 200),
              //     pageBuilder: (BuildContext context, Animation first,
              //         Animation second) {
              //       return Center(
              //         child: Container(
              //           width: MediaQuery.of(context).size.width - 10,
              //           height: MediaQuery.of(context).size.height - 80,
              //           padding: EdgeInsets.all(20),
              //           // color: Colors.white.withOpacity(0.080),
              //           color: Colors.white.withOpacity(0.85),
              //           child: Column(
              //             children: [
              //               ElevatedButton(
              //                   onPressed: () {}, child: Text("Click here")),
              //             ],
              //           ),
              //         ),
              //       );
              //     });
            },
            child: Icon(
              Icons.person,
              size: 300,
            ),
          )
        ],
      )),
    ));
  }

  // Future mydilog() {
  //   return Get.defaultDialog(
  //     title: "helo",
  //   );
  // }

  // void custom_alert() {
  //   var screen_height = MediaQuery.of(context).size.height;
  //   var screen_width = MediaQuery.of(context).size.width;
  //   return WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await showDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         // title: Text("title"),
  //         content: Container(
  //           color: Colors.white,
  //           height: double.maxFinite,
  //           child: Column(
  //             children: [
  //               ElevatedButton(
  //                   onPressed: () {}, child: Text("Log in with google"))
  //             ],
  //           ),
  //         ),
  //         // actions: <Widget>[
  //         //   ElevatedButton(
  //         //     child: Text("OK"),
  //         //     onPressed: () {
  //         //       Navigator.of(context).pop();
  //         //     },
  //         //   ),
  //         // ],
  //       ),
  //     );
  //   });
  // }

  void mydilog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    color: Colors.black,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'with google',
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    color: Colors.black,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
