import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messxp/controller/mess_expense_controller.dart';

class MessExpenseScreen extends StatefulWidget {
  // const MessExpense({Key? key}) : super(key: key);

  @override
  State<MessExpenseScreen> createState() => _MessExpenseScreenState();
}

class _MessExpenseScreenState extends State<MessExpenseScreen> {

  final MessExpenseController controller = Get.put(MessExpenseController());

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



    return Scaffold(
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
      body: Container(
        child: Obx(() =>
          controller.isLoading.value == true ? Center(
            child: CircularProgressIndicator(color:Colors.blueGrey,),
          ) : Padding(
            padding:  EdgeInsets.all(8.0),
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
                      controller.messExpenseModel.value.quickExpense!.length,
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
                                    Icon(IconDataSolid(int.parse('0x${controller.messExpenseModel.value.quickExpense![index].icon}'))),
                                    Text(controller.messExpenseModel.value.quickExpense![index].expenseName.toString(),style: TextStyle(
                                      fontSize: screenHeight * 0.015
                                    ),),
                                    Text(
                                      "৳",
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.025,
                                      ),
                                    ),
                                    Text(controller.messExpenseModel.value.quickExpense![index].amount.toString()),
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
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: screenHeight * 0.010
                            ),
                            child: Text(
                              "Total Expenses this month: ${controller.totalCost.value.toString()}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
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
          ),
        )

      ),
    );
  }
}
