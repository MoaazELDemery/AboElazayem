import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza21 extends StatefulWidget {
  @override
  _AyatFromJuza21State createState() => _AyatFromJuza21State();
}

class _AyatFromJuza21State extends State<AyatFromJuza21> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 46,
            juzaCat: true,
            juzaAyaCount: 69,
            swraId: 29,
            nextSwraName: "",
            swraName: "العنكبوت",
            place: "مكية ",
            ayaCount: "69 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 60,
            swraId: 30,
            nextSwraName: "",
            swraName: "الروم",
            place: "مكية",
            ayaCount: "60 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 34,
            swraId: 31,
            nextSwraName: "",
            swraName: "لقمان",
            place: "مكية",
            ayaCount: "34 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 30,
            swraId: 32,
            nextSwraName: "",
            swraName: "السجدة",
            place: "مكية",
            ayaCount: "30 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 30,
            swraId: 33,
            nextSwraName: "",
            swraName: "الأحزاب",
            place: "مدنية",
            ayaCount: "73 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
