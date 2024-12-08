import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza26 extends StatefulWidget {
  @override
  _AyatFromJuza26State createState() => _AyatFromJuza26State();
}

class _AyatFromJuza26State extends State<AyatFromJuza26> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 35,
            swraId: 46,
            nextSwraName: "",
            swraName: "الأحقاف",
            place: "مكية",
            ayaCount: "35 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 38,
            swraId: 47,
            nextSwraName: "",
            swraName: "محمد",
            place: "مدنية",
            ayaCount: "38 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 29,
            swraId: 48,
            nextSwraName: "",
            swraName: "الفتح",
            place: "مدنية",
            ayaCount: "29 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 18,
            swraId: 49,
            nextSwraName: "",
            swraName: "الحجرات",
            place: "مدنية",
            ayaCount: "18 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 45,
            swraId: 50,
            nextSwraName: "",
            swraName: "ق",
            place: "مكية",
            ayaCount: "45 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 30,
            swraId: 51,
            nextSwraName: "",
            swraName: "الذاريات",
            place: "مكية",
            ayaCount: "60 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
