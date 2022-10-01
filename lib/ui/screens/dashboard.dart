import 'package:flutter/material.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        title: DText(text: "Appbar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DText(
                      text: "Meal Rate",
                      fontSize: 30,
                    ),
                  ],
                ),
                // Stack(
                //   children: [
                //     Positioned(
                //       top: 30,
                //       left: 30,
                //       height: 250,
                //       width: 250,
                //       child: Container(
                //         width: 150,
                //         height: 150,
                //         color: Colors.green[300],
                //         child: Text(
                //           'Green',
                //           style: TextStyle(color: Colors.white, fontSize: 20),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                // PhysicalModel(
                //       color: Colors.black,
                //       shape: BoxShape.circle,
                //       elevation: 20.0,
                //       child: Stack(
                //         alignment: Alignment.center,
                //         children: [
                //           CircleAvatar(
                //             backgroundColor: Color(0xffE5D194).withOpacity(.8),
                //             radius: 80,
                //           ),
                //           CircleAvatar(
                //             backgroundColor: Color(0xffCEC9BA),
                //             radius: 65,
                //           ),
                //           CircleAvatar(
                //             backgroundColor: Color(0xffF2C94C),
                //             radius: 63,
                //           ),
                //           CircleAvatar(
                //             backgroundColor: Color(0xffFFFFFF),
                //             radius: 45,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       "৳",
                //                       style: TextStyle(
                //                         fontSize: 20,
                //                         color: Colors.grey,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       "48.88",
                //                       style: TextStyle(
                //                           fontSize: 20,
                //                           color: Colors.grey,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
              ],
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     color: Colors.red,
          //   ),
          // ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
    ));
  }
}
