import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import 'quran_api.dart';

class AyatFromJuza extends StatefulWidget {
  final int juzaId;

  AyatFromJuza({required this.juzaId});

  @override
  _AyatFromJuzaState createState() => _AyatFromJuzaState();
}

class _AyatFromJuzaState extends State<AyatFromJuza> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            swraId: 1,
            nextSwraName: "البقرة",
            swraName: "الفاتحة",
            place: "مكية",
            ayaCount: "7 أيات",
            nextPlace: "مدنية",
            nextAyaCount: "286 أية "),
        AyatFromSwarScreen(
            juzaCat: true,
            swraId: 2,
            nextSwraName: " آل عمران",
            swraName: "البقرة",
            place: "مدنية",
            ayaCount: "286 أية",
            nextPlace: "مدنية",
            nextAyaCount: "200 أية "),
      ],
    ));
  }
}
