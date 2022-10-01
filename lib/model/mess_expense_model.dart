// To parse this JSON data, do
//
//     final messExpense = messExpenseFromJson(jsonString);

import 'dart:convert';

MessExpense messExpenseFromJson(String str) => MessExpense.fromJson(json.decode(str));

String messExpenseToJson(MessExpense data) => json.encode(data.toJson());

class MessExpense {
  MessExpense({
    this.status,
    this.quickExpense,
  });

  int? status;
  List<QuickExpense>? quickExpense;

  factory MessExpense.fromJson(Map<String, dynamic> json) => MessExpense(
    status: json["status"],
    quickExpense: List<QuickExpense>.from(json["quick_expense"].map((x) => QuickExpense.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "quick_expense": List<dynamic>.from(quickExpense!.map((x) => x.toJson())),
  };
}

class QuickExpense {
  QuickExpense({
    this.id,
    this.expenseName,
    this.amount,
    this.icon,
    this.currency,
    this.messId,
    this.userId,
  });

  int? id;
  String? expenseName;
  String? amount;
  String? icon;
  String? currency;
  String? messId;
  String? userId;


  factory QuickExpense.fromJson(Map<String, dynamic> json) => QuickExpense(
    id: json["id"],
    expenseName: json["expense_name"],
    amount: json["amount"],
    icon: json["icon"],
    currency: json["currency"],
    messId: json["mess_id"],
    userId: json["user_id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "expense_name": expenseName,
    "amount": amount,
    "icon": icon,
    "currency": currency,
    "mess_id": messId,
    "user_id": userId,

  };
}
