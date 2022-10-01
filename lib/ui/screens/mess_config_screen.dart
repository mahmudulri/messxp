import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                height: 150,
                width: screen_width,
                decoration: BoxDecoration(),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/image-1.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 10,
                  ),
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "House/Mess Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Owner Info..................................../ Owner Info
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Owner info : ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "Owner name",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Owner address",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Owner Phone number",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // House Emergency ..................................../ House Emergency
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "House Emergency",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "Caretaker name",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Caretaker phone number",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //  Emergency Utility ..................................../  Emergency Utility
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Emergency & Utility",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "ISP number:",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Paper",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Water supply",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Fire service",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        "Pest control",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Text(
                "No of Flat: " + room.toString(),
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
          ],
        ),
      ),
    ));
  }
}
