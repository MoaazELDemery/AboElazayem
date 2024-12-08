import 'package:flutter/material.dart';

class MaraqiTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  MaraqiTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory MaraqiTextModel.fromJson(Map<String, dynamic> jsonData) {
    return MaraqiTextModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        description_ar: jsonData['description_ar'] != null
            ? jsonData['description_ar']
            : ' ',
        description_en: jsonData['description_en'] != null
            ? jsonData['description_en']
            : ' ');
  }
}
