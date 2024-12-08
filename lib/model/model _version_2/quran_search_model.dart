import 'package:com.app.aboelazayem/model/quraan_model.dart';
import 'package:flutter/material.dart';

class SearchDataModel {
  final int verse_number;
  final int surah_number;
  final String content;

  SearchDataModel(
      {required this.verse_number,
      required this.surah_number,
      required this.content});
}

final String tableBookMark = 'bookmark5';

class BookMarkFields {
  static final String id = '_id';
  static final String scrollId = 'scrollId';
  static final String selected = 'selected';
  static final String swraId = 'swraId';
  static final String swarName = 'swarName';
  static final String nextSwraName = 'nextSwraName';
  static final String ayaCount = 'ayaCount';
  static final String nextAyaCount = 'nextAyaCount';
  static final String place = 'place';
  static final String nextAyaPlace = 'nextAyaPlace';
}

class BookMarkDataModel {
  final int? id;
  final int scrollId;
  final int selected;
  final int swraId;
  final String swarName;
  final String nextSwraName;
  final String ayaCount;
  final String nextAyaCount;
  final String place;
  final String nextAyaPlace;

  BookMarkDataModel({
    this.id,
    required this.scrollId,
    required this.selected,
    required this.swraId,
    required this.swarName,
    required this.nextSwraName,
    required this.ayaCount,
    required this.nextAyaCount,
    required this.place,
    required this.nextAyaPlace,
  });

  BookMarkDataModel copy({
    int? id,
    int? scrollId,
    int? selected,
    int? swraId,
    String? swarName,
    String? nextSwraName,
    String? ayaCount,
    String? nextAyaCount,
    String? place,
    String? nextAyaPlace,
  }) =>
      BookMarkDataModel(
          id: id ?? this.id,
          scrollId: scrollId ?? this.scrollId,
          selected: selected ?? this.selected,
          swraId: swraId ?? this.swraId,
          swarName: swarName ?? this.swarName,
          nextSwraName: nextSwraName ?? this.nextSwraName,
          ayaCount: ayaCount ?? this.ayaCount,
          nextAyaCount: nextAyaCount ?? this.nextAyaCount,
          place: place ?? this.place,
          nextAyaPlace: nextAyaPlace ?? this.nextAyaPlace);

  Map<String, Object> toJson() => {
        BookMarkFields.id: id!,
        BookMarkFields.scrollId: scrollId,
        BookMarkFields.selected: selected,
        BookMarkFields.swraId: swraId,
        BookMarkFields.swarName: swarName,
        BookMarkFields.nextSwraName: nextSwraName,
        BookMarkFields.ayaCount: ayaCount,
        BookMarkFields.nextAyaCount: nextAyaCount,
        BookMarkFields.place: place,
        BookMarkFields.nextAyaPlace: nextAyaPlace
      };
}

class LastReadDataModel {
  final int verse_number;
  final int surah_number;
  final String content;

  LastReadDataModel(
      {required this.verse_number,
      required this.surah_number,
      required this.content});
}
