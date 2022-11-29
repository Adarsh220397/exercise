import 'package:flutter/material.dart';

class PaymentCategoryModel {
  Icon icon;
  String title;
  Color color;

  PaymentCategoryModel({
    required this.icon,
    required this.title,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['color'] = color;

    return data;
  }

  factory PaymentCategoryModel.fromJson(dynamic json) {
    return PaymentCategoryModel(
      icon: json['icon'] as Icon,
      title: json['title'] as String,
      color: json['color'] as Color,
    );
  }
}
