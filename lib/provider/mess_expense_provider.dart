

import 'package:get/get.dart';
import 'package:messxp/model/mess_expense_model.dart';

class MessExpenseProvider extends GetConnect {


  Future<MessExpense?> getMessExpense() async {

    String logInToken = '198|pJ2sBQdL9dNXW13DdtgfmizUC8qEXvpOiQNRD5DX';

    var response = await get(
       'http://172.31.120.238:80/api/quick-expense',

        headers: {'Authorization': 'Bearer $logInToken'});
    print(response.statusCode.toString());

    if (response.statusCode == 200) {

      if(response.body['status'] == 200){
        var jsonString = response.body;
        print(jsonString.toString());
        return MessExpense.fromJson(jsonString);
      }
    } else {
      return null;
    }
  }
}