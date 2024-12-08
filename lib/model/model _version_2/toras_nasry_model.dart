import 'package:flutter/material.dart';

class TorasNasryAboutModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  TorasNasryAboutModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory TorasNasryAboutModel.fromJson(Map<String, dynamic> jsonData) {
    return TorasNasryAboutModel(
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

class TorasNasryLibrarriesModel {
  final int id;
  final String name_ar;
  final String name_en;

  TorasNasryLibrarriesModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
  });
  factory TorasNasryLibrarriesModel.fromJson(Map<String, dynamic> jsonData) {
    return TorasNasryLibrarriesModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ');
  }
}

/*========================================= library  =========================================== */
class TroasNasryLibraryCategoryModel {
  final int id;
  final String name_ar;
  final String name_en;

  TroasNasryLibraryCategoryModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
  });
  factory TroasNasryLibraryCategoryModel.fromJson(
      Map<String, dynamic> jsonData) {
    return TroasNasryLibraryCategoryModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ');
  }
}

class TroasNasryLibraryTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  TroasNasryLibraryTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory TroasNasryLibraryTextModel.fromJson(Map<String, dynamic> jsonData) {
    return TroasNasryLibraryTextModel(
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
/*========================================= book  =========================================== */

class TrosNasryBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  TrosNasryBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});
  factory TrosNasryBookModel.fromJson(Map<String, dynamic> jsonData) {
    return TrosNasryBookModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ',
      pdf_path: jsonData['pdf_path'] != null ? jsonData['pdf_path'] : ' ',
    );
  }
}
