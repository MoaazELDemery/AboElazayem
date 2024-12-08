import 'package:flutter/material.dart';

class MediaTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  MediaTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory MediaTextModel.fromJson(Map<String, dynamic> jsonData) {
    return MediaTextModel(
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

class ButtonLibraryModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;
  final List video;

  ButtonLibraryModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.type,
      required this.video});
  factory ButtonLibraryModel.fromJson(Map<String, dynamic> jsonData) {
    return ButtonLibraryModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        type: jsonData['type'] != null ? jsonData['type'] : ' ',
        video: jsonData['video'].map((e) {
          return VideoLinkModel.fromJson(e);
        }).toList());
  }
}

class VideoLinkModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;
  final String video;

  VideoLinkModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en,
      required this.video});
  factory VideoLinkModel.fromJson(Map<String, dynamic> jsonData) {
    return VideoLinkModel(
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
