import 'package:flutter/material.dart';

class AudioMediaTextModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  AudioMediaTextModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory AudioMediaTextModel.fromJson(Map<String, dynamic> jsonData) {
    return AudioMediaTextModel(
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

class AudioButtonLibraryModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String type;
  final List audio;

  AudioButtonLibraryModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.type,
      required this.audio});
  factory AudioButtonLibraryModel.fromJson(Map<String, dynamic> jsonData) {
    return AudioButtonLibraryModel(
        id: jsonData['id'],
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        type: jsonData['type'] != null ? jsonData['type'] : ' ',
        audio: jsonData['audio'].map((e) {
          return AudioLinkModel.fromJson(e);
        }).toList());
  }
}

class AudioLinkModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;
  final String audio_path;

  AudioLinkModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en,
      required this.audio_path});
  factory AudioLinkModel.fromJson(Map<String, dynamic> jsonData) {
    return AudioLinkModel(
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
