import 'package:flutter/material.dart';

class TasofHomeAboutModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  TasofHomeAboutModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory TasofHomeAboutModel.fromJson(Map<String, dynamic> jsonData) {
    return TasofHomeAboutModel(
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

class TasofHomeLibraryModel {
  final int id;
  final String name_ar;
  final String name_en;

  TasofHomeLibraryModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
  });
  factory TasofHomeLibraryModel.fromJson(Map<String, dynamic> jsonData) {
    return TasofHomeLibraryModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
    );
  }
}

/*======================================================================= */

class TasofLibraryTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  TasofLibraryTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory TasofLibraryTextModel.fromJson(Map<String, dynamic> jsonData) {
    return TasofLibraryTextModel(
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

class TasofLibraryBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  TasofLibraryBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});
  factory TasofLibraryBookModel.fromJson(Map<String, dynamic> jsonData) {
    return TasofLibraryBookModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ',
      pdf_path: jsonData['pdf_path'] != null ? jsonData['pdf_path'] : ' ',
    );
  }
}
