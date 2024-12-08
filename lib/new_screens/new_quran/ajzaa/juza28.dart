import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza28 extends StatefulWidget {
  @override
  _AyatFromJuza28State createState() => _AyatFromJuza28State();
}

class _AyatFromJuza28State extends State<AyatFromJuza28> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 22,
            swraId: 58,
            nextSwraName: "",
            swraName: "المجادلة",
            place: "مدنية",
            ayaCount: "22 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 24,
            swraId: 59,
            nextSwraName: "",
            swraName: "الحشر",
            place: "مدنية",
            ayaCount: "24 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 13,
            swraId: 60,
            nextSwraName: "",
            swraName: "الممتحنة",
            place: "مدنية",
            ayaCount: "13 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 14,
            swraId: 61,
            nextSwraName: "",
            swraName: "الصف",
            place: "مدنية",
            ayaCount: "14 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 11,
            swraId: 62,
            nextSwraName: "",
            swraName: "الجمعة",
            place: "مدنية",
            ayaCount: "11 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 11,
            swraId: 63,
            nextSwraName: "",
            swraName: "المنافقون",
            place: "مدنية",
            ayaCount: "11 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 18,
            swraId: 64,
            nextSwraName: "",
            swraName: "التغابن",
            place: "مدنية",
            ayaCount: "18 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 12,
            swraId: 65,
            nextSwraName: "",
            swraName: "الطلاق",
            place: "مدنية",
            ayaCount: "12 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 12,
            swraId: 66,
            nextSwraName: "",
            swraName: "التحريم",
            place: "مدنية",
            ayaCount: "12 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
