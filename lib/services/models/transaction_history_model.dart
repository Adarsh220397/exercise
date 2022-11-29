import 'package:flutter/material.dart';

class TransactionHistoryModel {
  String name;
  DateTime date;
  num amount;
  String currency;
  bool btransactionStatus;
  Color color;

  TransactionHistoryModel({
    required this.name,
    required this.date,
    required this.amount,
    required this.currency,
    required this.btransactionStatus,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    data['date'] = date;
    data['amount'] = amount;
    data['currency'] = currency;
    data['btransactionStatus'] = btransactionStatus;

    return data;
  }

  factory TransactionHistoryModel.fromJson(dynamic json) {
    return TransactionHistoryModel(
      name: json['name'] as String,
      date: json['date'] as DateTime,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      btransactionStatus: json['btransactionStatus'] as bool,
      color: json['color'] as Color,
    );
  }
}
