import 'package:flutter/material.dart';

class AboutNazmyModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  AboutNazmyModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory AboutNazmyModel.fromJson(Map<String, dynamic> jsonData) {
    return AboutNazmyModel(
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

class NazmyLibraryModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;

  NazmyLibraryModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.type,
  });
  factory NazmyLibraryModel.fromJson(Map<String, dynamic> jsonData) {
    return NazmyLibraryModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      type: jsonData['type'] != null ? jsonData['type'] : ' ',
    );
  }
}

/*==================================================== */

class NazmyLibraryTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  NazmyLibraryTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory NazmyLibraryTextModel.fromJson(Map<String, dynamic> jsonData) {
    return NazmyLibraryTextModel(
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

class NazmyLibraryCategoryModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;

  NazmyLibraryCategoryModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.type,
  });
  factory NazmyLibraryCategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return NazmyLibraryCategoryModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      type: jsonData['type'] != null ? jsonData['type'] : ' ',
    );
  }
}

/*================================================================================================= */

class NazmyLibraryBookTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  NazmyLibraryBookTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory NazmyLibraryBookTextModel.fromJson(Map<String, dynamic> jsonData) {
    return NazmyLibraryBookTextModel(
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

class NazmyLibraryBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  NazmyLibraryBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});
  factory NazmyLibraryBookModel.fromJson(Map<String, dynamic> jsonData) {
    return NazmyLibraryBookModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ',
      pdf_path: jsonData['pdf_path'] != null ? jsonData['pdf_path'] : ' ',
    );
  }
}
