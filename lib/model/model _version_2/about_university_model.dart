import 'package:flutter/material.dart';

class AboutUniversityModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  AboutUniversityModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});

  factory AboutUniversityModel.fromJson(Map<String, dynamic> jsonData) {
    return AboutUniversityModel(
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

/*=========================  university library ============================ */

class UniversityLibraryTitle {
  final int id;
  final String name_ar;
  final String name_en;

  UniversityLibraryTitle(
      {required this.id, required this.name_ar, required this.name_en});

  factory UniversityLibraryTitle.fromJson(Map<String, dynamic> jsonData) {
    return UniversityLibraryTitle(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en']);
  }
}

class LibraryUniversityTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  LibraryUniversityTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});

  factory LibraryUniversityTextModel.fromJson(Map<String, dynamic> jsonData) {
    return LibraryUniversityTextModel(
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

class LibraryUniverrsityBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  LibraryUniverrsityBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});

  factory LibraryUniverrsityBookModel.fromJson(Map<String, dynamic> jsonData) {
    return LibraryUniverrsityBookModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en'],
        img_path: jsonData['img_path'],
        pdf_path: jsonData['pdf_path']);
  }
}

class ConverstionModel {
  final int id;
  final String name_ar;

  final String pdf_path;

  ConverstionModel(
      {required this.id, required this.name_ar, required this.pdf_path});

  factory ConverstionModel.fromJson(Map<String, dynamic> jsonData) {
    return ConverstionModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        pdf_path: jsonData['pdf_path']);
  }
}
