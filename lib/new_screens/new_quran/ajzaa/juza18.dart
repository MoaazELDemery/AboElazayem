import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza18 extends StatefulWidget {
  @override
  _AyatFromJuza18State createState() => _AyatFromJuza18State();
}

class _AyatFromJuza18State extends State<AyatFromJuza18> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 118,
            swraId: 23,
            nextSwraName: "",
            swraName: "المؤمنون",
            place: "مكية",
            ayaCount: "118 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 64,
            swraId: 24,
            nextSwraName: "",
            swraName: "النور",
            place: "مدنية",
            ayaCount: "64 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 20,
            swraId: 25,
            nextSwraName: "",
            swraName: "الفرقان",
            place: "مكية",
            ayaCount: "77 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
