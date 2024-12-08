import 'package:flutter/foundation.dart';

class SheikhModel {
  final int id;
  final String name_ar;
  final String name_en;
  final String img_path;
  final dynamic sheikh_one;
  final List audios;
  final List sheikhText;
  final List visual;
  final List cardPupil;

  SheikhModel(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.img_path,
      required this.sheikh_one,
      required this.audios,
      required this.sheikhText,
      required this.visual,
      required this.cardPupil});

  factory SheikhModel.fromJson(Map<String, dynamic> jsonData) {
    return SheikhModel(
      id: jsonData["id"],
      name_ar: jsonData["name_ar"] != null ? jsonData["name_ar"] : ' ',
      name_en: jsonData["name_en"] != null ? jsonData["name_en"] : ' ',
      img_path: jsonData["img_path"],
      sheikh_one: jsonData["sheikh_one"],
      audios: jsonData["audios"],
      sheikhText: jsonData["sheikh_text"],
      visual: jsonData["visual"],
      cardPupil: jsonData["card_pupil"],
    );
  }
}

class SheikhOneModel {
  final int id;
  final int sheikh_id;
  final String title_ar;
  final String title_en;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;
  final String img_path;

  SheikhOneModel(
      {required this.id,
      required this.sheikh_id,
      required this.title_ar,
      required this.title_en,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en,
      required this.img_path});

  factory SheikhOneModel.fromJson(Map<String, dynamic> jsonData) {
    return SheikhOneModel(
      id: jsonData["id"],
      sheikh_id: jsonData["sheikh_id"],
      title_ar: jsonData["title_ar"] != null ? jsonData["title_ar"] : ' ',
      title_en: jsonData["title_en"] != null ? jsonData["title_en"] : ' ',
      name_ar: jsonData["name_ar"] != null ? jsonData["name_ar"] : ' ',
      name_en: jsonData["name_en"] != null ? jsonData["name_en"] : ' ',
      description_ar:
          jsonData["description_ar"] != null ? jsonData["description_ar"] : ' ',
      description_en:
          jsonData["description_en"] != null ? jsonData["description_en"] : ' ',
      img_path: jsonData["img_path"],
    );
  }
}

class AudiosModel {
  final int id;
  final int sheikh_id;
  final String name_ar;
  final String name_en;
  final String audio_path;

  AudiosModel(
      {required this.id,
      required this.sheikh_id,
      required this.name_ar,
      required this.name_en,
      required this.audio_path});

  factory AudiosModel.fromJson(Map<String, dynamic> jsonData) {
    return AudiosModel(
      id: jsonData["id"],
      sheikh_id: jsonData["sheikh_id"],
      name_ar: jsonData["name_ar"] != null ? jsonData["name_ar"] : ' ',
      name_en: jsonData["name_en"] != null ? jsonData["name_en"] : ' ',
      audio_path: jsonData["audio_path"],
    );
  }
}

class VisualModel {
  final int id;
  final int sheikh_id;
  final String name_ar;
  final String name_en;
  final String visual;
  final String description_ar;
  final String description_en;

  VisualModel({
    required this.id,
    required this.sheikh_id,
    required this.name_ar,
    required this.name_en,
    required this.visual,
    required this.description_ar,
    required this.description_en,
  });

  factory VisualModel.fromJson(Map<String, dynamic> jsonData) {
    return VisualModel(
      id: jsonData["id"],
      sheikh_id: jsonData["sheikh_id"],
      name_ar: jsonData["name_ar"] != null ? jsonData["name_ar"] : ' ',
      name_en: jsonData["name_en"] != null ? jsonData["name_en"] : ' ',
      visual: jsonData["visual"],
      description_ar:
          jsonData["description_ar"] != null ? jsonData["description_ar"] : ' ',
      description_en:
          jsonData["description_en"] != null ? jsonData["description_en"] : ' ',
    );
  }
}

class SheikhTextModel {
  final int id;
  final int sheikh_id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  SheikhTextModel({
    required this.id,
    required this.sheikh_id,
    required this.name_ar,
    required this.name_en,
    required this.description_ar,
    required this.description_en,
  });

  factory SheikhTextModel.fromJson(Map<String, dynamic> jsonData) {
    return SheikhTextModel(
      id: jsonData["id"],
      sheikh_id: jsonData["sheikh_id"],
      name_ar: jsonData["name_ar"] != null ? jsonData["name_ar"] : ' ',
      name_en: jsonData["name_en"] != null ? jsonData["name_en"] : ' ',
      description_ar:
          jsonData["description_ar"] != null ? jsonData["description_ar"] : ' ',
      description_en:
          jsonData["description_en"] != null ? jsonData["description_en"] : ' ',
    );
  }
}

class CardPupilModel {
  final int id;
  final int sheikh_id;
  final String title_ar;
  final String title_en;
  final String description_ar;
  final String description_en;
  final String img_path;

  CardPupilModel(
      {required this.id,
      required this.sheikh_id,
      required this.title_ar,
      required this.title_en,
      required this.description_ar,
      required this.description_en,
      required this.img_path});

  factory CardPupilModel.fromJson(Map<String, dynamic> jsonData) {
    return CardPupilModel(
      id: jsonData["id"],
      sheikh_id: jsonData["sheikh_id"],
      title_ar: jsonData["title_ar"] != null ? jsonData["title_ar"] : ' ',
      title_en: jsonData["title_en"] != null ? jsonData["title_en"] : ' ',
      description_ar:
          jsonData["description_ar"] != null ? jsonData["description_ar"] : ' ',
      description_en:
          jsonData["description_en"] != null ? jsonData["description_en"] : ' ',
      img_path: jsonData["img_path"],
    );
  }
}
