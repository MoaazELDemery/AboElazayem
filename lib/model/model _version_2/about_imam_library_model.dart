import 'package:flutter/material.dart';

class LibraryTitleModel {
  final int id;
  final String name_ar;
  final String name_en;

  LibraryTitleModel(
      {required this.id, required this.name_ar, required this.name_en});

  factory LibraryTitleModel.fromJson(Map<String, dynamic> jsonData) {
    return LibraryTitleModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en']);
  }
}

class LibraryImamTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  LibraryImamTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});

  factory LibraryImamTextModel.fromJson(Map<String, dynamic> jsonData) {
    return LibraryImamTextModel(
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

class LibraryImamBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  LibraryImamBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});

  factory LibraryImamBookModel.fromJson(Map<String, dynamic> jsonData) {
    return LibraryImamBookModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'],
        name_en: jsonData['name_en'],
        img_path: jsonData['img_path'],
        pdf_path: jsonData['pdf_path']);
  }
}
