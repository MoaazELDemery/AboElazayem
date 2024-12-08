import 'package:flutter/cupertino.dart';

class SuraName {
  final String sura_name;
  final String text;

  SuraName({required this.sura_name, required this.text});
  factory SuraName.fromJson(Map<String, dynamic> jsonData) {
    return SuraName(
      sura_name: jsonData['sura_name'],
      text: jsonData['text'],
    );
  }
}

class Aya {
  final int suraID;
  final int verseID;
  final String ayahText;

  Aya({required this.suraID, required this.verseID, required this.ayahText});

  factory Aya.fromJson(Map<String, dynamic> jsonData) {
    return Aya(
        suraID: jsonData['SuraID'],
        verseID: jsonData['VerseID'],
        ayahText: jsonData['AyahText']);
  }
}

class TafserImam {
  final int id;
  final int imam_id;
  final String tafser_ar;

  TafserImam(
      {required this.id, required this.imam_id, required this.tafser_ar});

  factory TafserImam.fromJson(Map<String, dynamic> jsonData) {
    return TafserImam(
        id: jsonData['id'] != null ? jsonData['id'] : 0,
        imam_id: jsonData['imam_id'] != null ? jsonData['imam_id'] : ' ',
        tafser_ar: jsonData['tafser_ar'] != null ? jsonData['tafser_ar'] : ' ');
  }
}

class ImamName {
  final String name_ar;
  final String name_en;

  ImamName({required this.name_ar, required this.name_en});

  factory ImamName.fromJson(Map<String, dynamic> jsonData) {
    return ImamName(
        name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
        name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ');
  }
}

class StudentName {
  final int student_id;
  final String description_ar;
  final String description_en;

  StudentName({
    required this.student_id,
    required this.description_ar,
    required this.description_en,
  });
  factory StudentName.fromJson(Map<String, dynamic> jsonData) {
    return StudentName(
      student_id: jsonData['student_id'] != null ? jsonData['student_id'] : 0,
      description_ar:
          jsonData['description_ar'] != null ? jsonData['description_ar'] : ' ',
      description_en:
          jsonData['description_en'] != null ? jsonData['description_en'] : ' ',
    );
  }
}

class StudentNameModel {
  final int id;
  final String name_ar;
  final String name_en;

  StudentNameModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
  });
  factory StudentNameModel.fromJson(Map<String, dynamic> jsonData) {
    return StudentNameModel(
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
    );
  }
}

class TypeModel {
  final int id;
  final String name_ar;
  final String name_en;

  TypeModel({
    required this.id,
    required this.name_ar,
    required this.name_en,
  });
  factory TypeModel.fromJson(Map<String, dynamic> jsonData) {
    return TypeModel(
      id: jsonData['id'] != null ? jsonData['id'] : 0,
      name_ar: jsonData['name_ar'] != null ? jsonData['name_ar'] : ' ',
      name_en: jsonData['name_en'] != null ? jsonData['name_en'] : ' ',
    );
  }
}

class ALmoyasar {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  ALmoyasar(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory ALmoyasar.fromJson(Map<String, dynamic> jsonData) {
    return ALmoyasar(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class Algalalyn {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  Algalalyn(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory Algalalyn.fromJson(Map<String, dynamic> jsonData) {
    return Algalalyn(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class Alsaady {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  Alsaady(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory Alsaady.fromJson(Map<String, dynamic> jsonData) {
    return Alsaady(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class AbnKatheer {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  AbnKatheer(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory AbnKatheer.fromJson(Map<String, dynamic> jsonData) {
    return AbnKatheer(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class Altabary {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  Altabary(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory Altabary.fromJson(Map<String, dynamic> jsonData) {
    return Altabary(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class Albagfwy {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  Albagfwy(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory Albagfwy.fromJson(Map<String, dynamic> jsonData) {
    return Albagfwy(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}

class Alkortaby {
  final int tafseer_id;
  final String tafseer_name;
  final String text;

  Alkortaby(
      {required this.tafseer_id,
      required this.tafseer_name,
      required this.text});

  factory Alkortaby.fromJson(Map<String, dynamic> jsonData) {
    return Alkortaby(
        tafseer_id: jsonData['tafseer_id'],
        tafseer_name: jsonData['tafseer_name'],
        text: jsonData['text']);
  }
}
