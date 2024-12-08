import 'package:flutter/foundation.dart';

class StudentModel {
  final int id;
  final String title_ar;
  final String name_ar;
  final String title_en;
  final String name_en;
  final String description_en;
  final String description_ar;

  final String img_path;

  StudentModel({
    required this.id,
    required this.title_ar,
    required this.name_ar,
    required this.description_ar,
    required this.img_path,
    required this.title_en,
    required this.name_en,
    required this.description_en,
  });

  factory StudentModel.fromJson(Map<String, dynamic> jsonData) {
    return StudentModel(
      id: jsonData['id'],
      title_ar: jsonData['title_ar'] != null ? jsonData['title_ar'] : ' ',
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      description_ar:
          jsonData['description_ar'] != null ? jsonData['description_ar'] : ' ',
      img_path: jsonData['img_path'],
      title_en: jsonData['title_en'] != null ? jsonData['title_en'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      description_en:
          jsonData['description_en'] != null ? jsonData['description_en'] : ' ',
    );
  }
}

class PupilTwo {
  final int id;

  final String name_ar;
  final String description_ar;
  final String name_en;
  final String description_en;

  PupilTwo({
    required this.id,
    required this.name_ar,
    required this.description_ar,
    required this.name_en,
    required this.description_en,
  });

  factory PupilTwo.fromJson(Map<String, dynamic> jsonData) {
    return PupilTwo(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        description_ar: jsonData['description_ar'] != null
            ? jsonData['description_ar']
            : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        description_en: jsonData['description_en'] != null
            ? jsonData['description_en']
            : ' ');
  }
}
