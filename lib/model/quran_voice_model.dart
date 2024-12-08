import 'package:flutter/cupertino.dart';

class SwarNames {
  final int sura_index;
  final String sura_name;

  SwarNames({required this.sura_index, required this.sura_name});

  factory SwarNames.fromJson(Map<String, dynamic> jsonData) {
    return SwarNames(
        sura_index: jsonData['sura_index'], sura_name: jsonData['sura_name']);
  }
}

class ShikhNames {
  final String id;
  final String name;
  final String server; // url of all songs
  final String rewaya;
  final String letter;

  ShikhNames(
      {required this.id,
      required this.name,
      required this.server,
      required this.rewaya,
      required this.letter});

  factory ShikhNames.fromJson(Map<String, dynamic> jsonData) {
    return ShikhNames(
        id: jsonData['id'],
        name: jsonData['name'],
        server: jsonData['Server'],
        rewaya: jsonData['rewaya'],
        letter: jsonData['letter']);
  }
}

class Value {
  final String value;

  Value({required this.value});

  factory Value.fromJson(Map<String, dynamic> jsonData) {
    return Value(value: jsonData['value']);
  }
}
