import 'package:flutter/foundation.dart';

class Library {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final List book;

  Library({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.img_path,
    required this.book,
  });

  factory Library.fromJson(Map<String, dynamic> jsonData) {
    return Library(
      id: jsonData["id"],
      name_ar: jsonData["name_ar"],
      name_en: jsonData["name_en"],
      img_path: jsonData["img_path"],
      book: jsonData["book"],
    );
  }
}

class Book {
  final int id;
  final int library_id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  Book({
    required this.id,
    required this.library_id,
    required this.name_ar,
    required this.name_en,
    required this.img_path,
    required this.pdf_path,
  });

  factory Book.fromJson(Map<String, dynamic> jsonData) {
    return Book(
      id: jsonData["id"],
      library_id: jsonData["library_id"],
      name_ar: jsonData["name_ar"],
      name_en: jsonData["name_en"],
      img_path: jsonData["img_path"],
      pdf_path: jsonData["pdf_path"],
    );
  }
}
