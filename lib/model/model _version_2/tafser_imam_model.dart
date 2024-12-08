import 'package:flutter/material.dart';

class TafserImamModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final List tafsir_book;

  TafserImamModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.tafsir_book});

  factory TafserImamModel.fromJson(Map<String, dynamic> jsonData) {
    return TafserImamModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ',
      tafsir_book: jsonData['tafsir_book'] != null
          ? jsonData['tafsir_book'].map((e) {
              return TafserBookModel.fromJson(e);
            }).toList()
          : ' ',
    );
  }
}

class TafserBookModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String pdf_path;

  TafserBookModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.pdf_path});

  factory TafserBookModel.fromJson(Map<String, dynamic> jsonData) {
    return TafserBookModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        pdf_path: jsonData['pdf_path'] != null ? jsonData['pdf_path'] : ' ');
  }
}
