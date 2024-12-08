import 'package:flutter/cupertino.dart';

class SwraModel {
  final int index;
  final String name;

  SwraModel({required this.index, required this.name});
  factory SwraModel.fromJson(Map<String, dynamic> jsonData) {
    return SwraModel(index: jsonData['index'], name: jsonData['name']);
  }
}

class SwraName {
  final int sura_index;
  final String sura_name;
  final List ayat;

  SwraName(
      {required this.sura_index,
      required this.sura_name,
      required this.ayat});

  factory SwraName.fromJson(Map<String, dynamic> jsonData) {
    return SwraName(
        sura_index: jsonData['sura_index'],
        sura_name: jsonData['sura_name'],
        ayat: jsonData['ayat']);
  }
}

class AyatModel {
  final int suraID;
  final int verseID;
  final String ayahText;

  AyatModel(
      {required this.suraID, required this.verseID, required this.ayahText});
  factory AyatModel.fromJson(Map<String, dynamic> jsonData) {
    return AyatModel(
        suraID: jsonData['SuraID'],
        verseID: jsonData['VerseID'],
        ayahText: jsonData['AyahText']);
  }
}
