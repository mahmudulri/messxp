

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:messxp/model/mess_expense_model.dart';
import 'package:messxp/provider/mess_expense_provider.dart';

class MessExpenseController extends GetxController {
  var isLoading = true.obs;
  var messExpenseModel = MessExpense().obs;
  var totalCost = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMessExpense();
  }



  Future<void> fetchMessExpense() async {
    
    try{
      isLoading(true);
    
      var expense = await MessExpenseProvider().getMessExpense();
      if (expense != null) {
        print("hellooww:: "+expense.toString());
        messExpenseModel.value = expense;

        int cost = 0;
        for(int i = 0 ; i<messExpenseModel.value.quickExpense!.length ; i++ ){
          int val = int.parse(messExpenseModel.value.quickExpense![i].amount.toString());
          cost = (cost + val) as int;
          totalCost.value = cost;
        }
        isLoading(false);
      }
    }
    catch(e){
      print(e.toString());
    }

  }
}