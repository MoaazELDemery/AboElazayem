import 'package:flutter/material.dart';

class ImamSonsTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  ImamSonsTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory ImamSonsTextModel.fromJson(Map<String, dynamic> jsonData) {
    return ImamSonsTextModel(
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

class ImamLibraryData {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  ImamLibraryData(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory ImamLibraryData.fromJson(Map<String, dynamic> jsonData) {
    return ImamLibraryData(
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

class ImamAboutTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;

  ImamAboutTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path});
  factory ImamAboutTextModel.fromJson(Map<String, dynamic> jsonData) {
    return ImamAboutTextModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ');
  }
}

class ButtonTypeModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;

  ButtonTypeModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.type,
  });
  factory ButtonTypeModel.fromJson(Map<String, dynamic> jsonData) {
    return ButtonTypeModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      type: jsonData['type'] != null ? jsonData['type'] : ' ',
    );
  }
}

class SheikhTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  SheikhTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory SheikhTextModel.fromJson(Map<String, dynamic> jsonData) {
    return SheikhTextModel(
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

class SheikhBtuModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;

  SheikhBtuModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.type,
  });
  factory SheikhBtuModel.fromJson(Map<String, dynamic> jsonData) {
    return SheikhBtuModel(
      id: jsonData['id'],
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
      type: jsonData['type'] != null ? jsonData['type'] : ' ',
    );
  }
}

class ImamPdfModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final String pdf_path;

  ImamPdfModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.pdf_path});
  factory ImamPdfModel.fromJson(Map<String, dynamic> jsonData) {
    return ImamPdfModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        img_path: jsonData['img_path'] != null ? jsonData['img_path'] : ' ',
        pdf_path: jsonData['pdf_path'] != null ? jsonData['pdf_path'] : ' ');
  }
}

class ImamVideoModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;
  final String video;

  ImamVideoModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en,
      required this.video});
  factory ImamVideoModel.fromJson(Map<String, dynamic> jsonData) {
    return ImamVideoModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        description_ar: jsonData['description_ar'] != null
            ? jsonData['description_ar']
            : ' ',
        description_en: jsonData['description_en'] != null
            ? jsonData['description_en']
            : ' ',
        video: jsonData['video'] != null ? jsonData['video'] : ' ');
  }
}

class ImamAudioModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;
  final String audio_path;

  ImamAudioModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en,
      required this.audio_path});
  factory ImamAudioModel.fromJson(Map<String, dynamic> jsonData) {
    return ImamAudioModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        description_ar: jsonData['description_ar'] != null
            ? jsonData['description_ar']
            : ' ',
        description_en: jsonData['description_en'] != null
            ? jsonData['description_en']
            : ' ',
        audio_path:
            jsonData['audio_path'] != null ? jsonData['audio_path'] : ' ');
  }
}
