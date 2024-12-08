import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza27 extends StatefulWidget {
  @override
  _AyatFromJuza27State createState() => _AyatFromJuza27State();
}

class _AyatFromJuza27State extends State<AyatFromJuza27> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 31,
            juzaCat: true,
            juzaAyaCount: 60,
            swraId: 51,
            nextSwraName: "",
            swraName: "الذاريات",
            place: "مكية",
            ayaCount: "60 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 49,
            swraId: 52,
            nextSwraName: "",
            swraName: "الطور",
            place: "مكية",
            ayaCount: "49 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 62,
            swraId: 53,
            nextSwraName: "",
            swraName: "النجم",
            place: "مكية",
            ayaCount: "62 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 55,
            swraId: 54,
            nextSwraName: "",
            swraName: "القمر",
            place: "مكية",
            ayaCount: "55 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 78,
            swraId: 55,
            nextSwraName: "",
            swraName: "الرحمن",
            place: "مدنية",
            ayaCount: "78 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 96,
            swraId: 56,
            nextSwraName: "",
            swraName: "الواقعة",
            place: "مكية",
            ayaCount: "96 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 29,
            swraId: 57,
            nextSwraName: "",
            swraName: "الحديد",
            place: "مدنية",
            ayaCount: "29 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
