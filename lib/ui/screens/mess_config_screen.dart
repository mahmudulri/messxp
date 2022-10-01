import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';
import 'package:messxp/ui/screen_components/mess_config_components.dart';
import 'package:messxp/ui/widgets/dtext.dart';

class MessConfigScreen extends StatefulWidget {
  const MessConfigScreen({Key? key}) : super(key: key);

  @override
  State<MessConfigScreen> createState() => _MessConfigScreenState();
}

class _MessConfigScreenState extends State<MessConfigScreen> {
  RangeValues values = RangeValues(0, 5);

  int flat = 5;
  int room = 5;

  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: DText(
          text: "Configuration",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Row(
                children: [
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Image gallery section.........................
            gallery_section(screen_width),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Propertie's Information",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // House / Mess name..................................../house mess name
            mess_information(),
            SizedBox(
              height: 30,
            ),
            // Owner Info..................................../ Owner Info
            owner_information(),
            SizedBox(
              height: 30,
            ),
            // House Emergency ..................................../ House Emergency
            house_emergency(),
            SizedBox(
              height: 30,
            ),
            //  Emergency Utility ..................................../  Emergency Utility
            emergency_utility(),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),

            //   Room & Seat Configuration................Room & Seat Configuration...........//
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Text(
                "Room & Seat Configuration",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Flat no...................Flat  no .............Flat no...............//
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Text(
                "No of Flat: " + flat.toString(),
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),

            Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.purple,
              thumbColor: Colors.green,
              divisions: 5,
              label: flat.toString(),
              value: flat.toDouble(),
              onChanged: (value) {
                setState(() {
                  flat = value.toInt();
                });
              },
              min: 1,
              max: 5,
            ),
            SizedBox(
              height: 10,
            ),

            // Room no.................Room no................Room no.......//
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Text(
                "No of Rooms: " + room.toString(),
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),

            Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.purple,
              thumbColor: Colors.green,
              divisions: 5,
              label: room.toString(),
              value: room.toDouble(),
              onChanged: (value) {
                setState(() {
                  room = value.toInt();
                });
              },
              min: 1,
              max: 5,
            ),
            continue_config_button(),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    ));
  }
}
