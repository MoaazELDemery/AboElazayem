import 'package:flutter/foundation.dart';

class Kasaed {
  final int id;
  final int num_verses;
  final int num_peom;
  final int rawy_id;
  final int sea_id;
  final String pname_ar;
  final String pname_en;
  final String occasion_ar;
  final String occasion_en;
  final String place_ar;
  final String place_en;
  final String date_birth;
  final String date_hijri;
  final String rawy_ar;
  final String rawy_en;
  final dynamic rawy;
  final dynamic sea;
  final List poem_rawies;
  final List listen;
  final List explained;

  Kasaed(
      {required this.id,
      required this.num_verses,
      required this.num_peom,
      required this.rawy_id,
      required this.sea_id,
      required this.pname_ar,
      required this.pname_en,
      required this.occasion_ar,
      required this.occasion_en,
      required this.place_ar,
      required this.place_en,
      required this.date_birth,
      required this.date_hijri,
      required this.rawy_ar,
      required this.rawy_en,
      required this.rawy,
      required this.sea,
      required this.poem_rawies,
      required this.listen,
      required this.explained});

  factory Kasaed.fromJson(Map<String, dynamic> jsonData) {
    return Kasaed(
      id: jsonData['id'],
      num_verses: jsonData['num_verses'],
      num_peom: jsonData['num_peom'],
      rawy_id: jsonData['rawy_id'],
      sea_id: jsonData['sea_id'],
      pname_ar: jsonData['pname_ar'],
      pname_en: jsonData['pname_en'],
      occasion_ar: jsonData['occasion_ar'],
      occasion_en: jsonData['occasion_en'],
      place_ar: jsonData['place_ar'],
      place_en: jsonData['place_en'],
      date_birth: jsonData['date_birth'],
      date_hijri: jsonData['date_hijri'],
      rawy_ar: jsonData['rawy_ar'],
      rawy_en: jsonData['rawy_en'],
      rawy: jsonData["rawy"],
      sea: jsonData['sea'],
      poem_rawies: jsonData['poem_rawies'],
      listen: jsonData['listen'],
      explained: jsonData['explained'],
    );
  }
}

class Rawy {
  final int id;
  final String rawy_ar;
  final String rawy_en;

  Rawy({required this.id, required this.rawy_ar, required this.rawy_en});

  factory Rawy.fromJson(Map<String, dynamic> jsonData) {
    return Rawy(
        id: jsonData['id'],
        rawy_ar: jsonData['rawy_ar'],
        rawy_en: jsonData['rawy_en']);
  }
}

class Sea {
  final int id;
  final String sea_ar;
  final String sea_en;

  Sea({required this.id, required this.sea_ar, required this.sea_en});

  factory Sea.fromJson(Map<String, dynamic> jsonData) {
    return Sea(
        id: jsonData['id'],
        sea_ar: jsonData['sea_ar'],
        sea_en: jsonData['sea_en']);
  }
}

class PoemRawies {
  final int id;
  final int poem_id;
  final String right_ar;
  final String right_en;
  final String left_ar;
  final String left_en;

  PoemRawies(
      {required this.id,
      required this.poem_id,
      required this.right_ar,
      required this.right_en,
      required this.left_ar,
      required this.left_en});

  factory PoemRawies.fromJson(Map<String, dynamic> jsonData) {
    return PoemRawies(
      id: jsonData['id'],
      poem_id: jsonData['poem_id'],
      right_ar: jsonData['right_ar'],
      right_en: jsonData['right_en'],
      left_ar: jsonData['left_ar'],
      left_en: jsonData['left_en'],
    );
  }
}

class Listen {
  final int id;
  final int poem_id;
  final String name_ar;
  final String description_ar;
  final String audio_path;

  Listen({
    required this.id,
    required this.poem_id,
    required this.name_ar,
    required this.description_ar,
    required this.audio_path,
  });

  factory Listen.fromJson(Map<String, dynamic> jsonData) {
    return Listen(
        id: jsonData['id'],
        poem_id: jsonData['poem_id'],
        name_ar: jsonData['name_ar'],
        description_ar: jsonData['description_ar'],
        audio_path: jsonData['audio_path']);
  }
}

class Explained {
  final int id;
  final int poem_id;
  final String name_ar;
  final String name_en;
  final String description_ar;
  final String description_en;

  Explained({
    required this.id,
    required this.poem_id,
    required this.name_ar,
    required this.name_en,
    required this.description_ar,
    required this.description_en,
  });

  factory Explained.fromJson(Map<String, dynamic> jsonData) {
    return Explained(
      id: jsonData['id'],
      poem_id: jsonData['poem_id'],
      name_ar: jsonData['name_ar'],
      name_en: jsonData['name_en'],
      description_ar: jsonData['description_ar'],
      description_en: jsonData['description_en'],
    );
  }
}
