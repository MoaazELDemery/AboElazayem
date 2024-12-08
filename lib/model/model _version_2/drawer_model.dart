import 'package:flutter/material.dart';

class DrawerModel {
  final int id;
  final String name_ar;
  final String name_en;

  DrawerModel(
      {required this.id, required this.name_ar, required this.name_en});

  factory DrawerModel.fromJson(Map<String, dynamic> jsonData) {
    return DrawerModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en']);
  }
}
