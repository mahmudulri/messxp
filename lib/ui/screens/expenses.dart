import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List mydata = [
      {"title": "House maid wages", "balance": "4000.00", "ispaid": "false"},
      {"title": "Gas Bill", "balance": "700.00", "ispaid": "true"},
      {"title": "Electricity Bill", "balance": "2000.00", "ispaid": "false"},
      {"title": "Cleaner Bill", "balance": "1500.00", "ispaid": "false"},
      {"title": "Internet Bill", "balance": "3000.00", "ispaid": "true"},
      {"title": "Others Bill", "balance": "300.00", "ispaid": "true"},
    ];

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.grey,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: GridView.count(
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: List.generate(
                      mydata.length,
                      (index) => Column(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.spa_rounded,
                                      size: 30,
                                    ),
                                    Text(mydata[index]["title"]),
                                    Text(
                                      "৳",
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(mydata[index]["balance"]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: mydata[index]["ispaid"] == "true"
                                    ? Color(0xff64C28C)
                                    : Color(0xffED8686),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        width: screenWidth - 50,
                        decoration: BoxDecoration(
                          color: Color(0xffF27575),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Expenses this month: 8000",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                                color: Colors.white,
                              ),
                              color: Color(0xffF27575),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
