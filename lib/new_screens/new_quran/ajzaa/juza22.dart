import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza22 extends StatefulWidget {
  @override
  _AyatFromJuza22State createState() => _AyatFromJuza22State();
}

class _AyatFromJuza22State extends State<AyatFromJuza22> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 31,
            juzaCat: true,
            juzaAyaCount: 73,
            swraId: 33,
            nextSwraName: "",
            swraName: "الأحزاب",
            place: "مدنية",
            ayaCount: "73 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 54,
            swraId: 34,
            nextSwraName: "",
            swraName: "سبأ",
            place: "مكية",
            ayaCount: "54 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 45,
            swraId: 35,
            nextSwraName: "",
            swraName: "فاطر",
            place: "مكية",
            ayaCount: "45 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 27,
            swraId: 36,
            nextSwraName: "",
            swraName: "يس",
            place: "مكية",
            ayaCount: "83 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
