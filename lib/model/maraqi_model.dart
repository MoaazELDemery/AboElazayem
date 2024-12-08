import 'package:flutter/foundation.dart';

class MaraqiModel {
  final int id;

  final String name_ar;
  final int parent_id;
  final String name_en;
  final dynamic post;
  final String img_path;

  MaraqiModel({
    required this.parent_id,
    required this.id,
    required this.name_ar,
    required this.img_path,
    required this.name_en,
    required this.post,
  });

  factory MaraqiModel.fromJson(Map<String, dynamic> jsonData) {
    return MaraqiModel(
        id: jsonData["id"],
        parent_id: jsonData['parent_id'],
        name_ar: jsonData['name_ar'],
        img_path: jsonData['img_path'],
        name_en: jsonData['name_en'],
        post: jsonData["post"]);
  }
}

class MaragiPost {
  final int id;
  final String name_ar;
  final String name_en;
  final String title_ar;
  final String title_en;
  final String description_ar;
  final String description_en;
  final int category_id;
  final String img_path;

  MaragiPost({
    required this.title_ar,
    required this.title_en,
    required this.category_id,
    required this.img_path,
    required this.id,
    required this.name_ar,
    required this.description_ar,
    required this.name_en,
    required this.description_en,
  });

  factory MaragiPost.fromJson(Map<String, dynamic> jsonData) {
    return MaragiPost(
        id: jsonData['id'],
        name_en: jsonData['name_en'],
        name_ar: jsonData['name_ar'],
        title_ar: jsonData['title_ar'],
        title_en: jsonData['title_en'],
        img_path: jsonData['img_path'],
        category_id: jsonData['category_id'],
        description_ar: jsonData['description_ar'],
        description_en: jsonData['description_en']);
  }
}
