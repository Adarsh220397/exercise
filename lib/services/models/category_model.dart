import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AllCategoryModel {
  Icon icon;
  String title;
  Color color;

  AllCategoryModel({
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

  factory AllCategoryModel.fromJson(dynamic json) {
    return AllCategoryModel(
      icon: json['icon'] as Icon,
      title: json['title'] as String,
      color: json['color'] as Color,
    );
  }
}
