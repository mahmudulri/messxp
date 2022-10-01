import 'package:flutter/material.dart';
import 'package:messxp/const/app_colors.dart';

Widget gallery_section(double screen_width) {
  return Padding(
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
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 10,
        ),
      ),
    ),
  );
}

// Owner Information.....................................Owner information

Widget owner_information() {
  return Padding(
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
                color: Colors.black45,
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
  );
}

// Mess Information........................// Mess name

Widget mess_information() {
  return Padding(
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
  );
}

//  House Emergency .............................
Widget house_emergency() {
  return Padding(
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
                color: Colors.black45,
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
  );
}

// Emergency Utility................Emergency Utility..................

Widget emergency_utility() {
  return Padding(
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
                color: Colors.black45,
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
  );
}

// Continue Button.........................button...............button

Widget continue_config_button() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 35,
      right: 35,
    ),
    child: GestureDetector(
      onTap: () {
        print("Continue clicked");
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.defalutColor),
              borderRadius: BorderRadius.circular(10)),
          height: 60,
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(
                fontFamily: "Ubuntu",
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          )),
    ),
  );
}
