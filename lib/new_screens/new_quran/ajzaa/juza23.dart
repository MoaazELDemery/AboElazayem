import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza23 extends StatefulWidget {
  @override
  _AyatFromJuza23State createState() => _AyatFromJuza23State();
}

class _AyatFromJuza23State extends State<AyatFromJuza23> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 28,
            juzaCat: true,
            juzaAyaCount: 83,
            swraId: 36,
            nextSwraName: "",
            swraName: "يس",
            place: "مكية",
            ayaCount: "83 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 182,
            swraId: 37,
            nextSwraName: "",
            swraName: "الصافات",
            place: "مكية",
            ayaCount: "182 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 88,
            swraId: 38,
            nextSwraName: "",
            swraName: "ص",
            place: "مكية",
            ayaCount: "88 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 31,
            swraId: 39,
            nextSwraName: "",
            swraName: "الزمر",
            place: "مكية",
            ayaCount: "75 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
