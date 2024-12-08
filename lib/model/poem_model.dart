import 'package:flutter/cupertino.dart';

class Poem {
  final int id;
  final int num_peom;
  final int num_verses;
  final int rawy_id;
  final String name_sea;
  final String pname_ar;
  final String pname_en;
  final String occasion_ar;
  final String occasion_en;
  final String place_ar;
  final String place_en;
  final String rawy_ar;
  final String rawy_en;
  final String date_birth;
  final String date_hijri;

  Poem({
    required this.date_birth,
    required this.date_hijri,
    required this.id,
    required this.num_peom,
    required this.num_verses,
    required this.rawy_id,
    required this.name_sea,
    required this.pname_ar,
    required this.pname_en,
    required this.occasion_ar,
    required this.occasion_en,
    required this.place_ar,
    required this.place_en,
    required this.rawy_ar,
    required this.rawy_en,
  });

  factory Poem.fromJson(Map<String, dynamic> jsonData) {
    return Poem(
        id: jsonData['id'], //-------
        num_peom: jsonData['num_peom'], //-----------
        num_verses: jsonData['num_verses'], //------
        rawy_id: jsonData['rawy_id'],
        name_sea: jsonData['name_sea'],
        pname_ar: jsonData['pname_ar'], //------
        pname_en: jsonData['pname_en'],
        occasion_ar: jsonData['occasion_ar'], //--
        occasion_en: jsonData['occasion_en'],
        place_ar: jsonData['Place_ar'], //---
        place_en: jsonData['Place_en'],
        rawy_ar: jsonData['rawy_ar'],
        rawy_en: jsonData['rawy_en'],
        date_birth: jsonData['date_birth'],
        date_hijri: jsonData['date_hijri']);
  }
}

class PoemVerse {
  final int id;
  final String right_ar;
  final String right_en;
  final String left_ar;
  final String left_en;
  final String filter_right;

  final String filter_left;

  PoemVerse(
      {required this.filter_right,
      required this.filter_left,
      required this.id,
      required this.right_ar,
      required this.right_en,
      required this.left_ar,
      required this.left_en});
  factory PoemVerse.fromJson(Map<String, dynamic> jsonData) {
    return PoemVerse(
      id: jsonData['id'],
      right_ar: jsonData['right_ar'],
      right_en: jsonData['right_en'],
      left_ar: jsonData['left_ar'],
      left_en: jsonData['left_en'],
      filter_right: jsonData['filter_right'],
      filter_left: jsonData['filter_left'],
    );
  }
}

class Explain {
  final int id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  Explain(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.description_ar,
      required this.description_en});
  factory Explain.fromJson(Map<String, dynamic> jsonData) {
    return Explain(
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

class ListenPoem {
  final int id;
  final String name_ar;
  final String name_en;
  final String audio_path;

  ListenPoem(
      {required this.id,
      required this.name_ar,
      required this.name_en,
      required this.audio_path});

  factory ListenPoem.fromJson(Map<String, dynamic> jsonData) {
    return ListenPoem(
        id: jsonData['id'] != null ? jsonData['id'] : ' ',
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
        audio_path:
            jsonData['audio_path'] != null ? jsonData['audio_path'] : ' ');
  }
}
