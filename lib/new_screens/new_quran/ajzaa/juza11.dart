import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza11 extends StatefulWidget {
  @override
  _AyatFromJuza11State createState() => _AyatFromJuza11State();
}

class _AyatFromJuza11State extends State<AyatFromJuza11> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 92,
            juzaCat: true,
            juzaAyaCount: 129,
            swraId: 9,
            nextSwraName: "",
            swraName: "التوبة",
            place: "مدنية",
            ayaCount: "129 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 109,
            swraId: 10,
            nextSwraName: "",
            swraName: "يونس",
            place: "مكية",
            ayaCount: "109 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            scrollId: 1,
            juzaCat: true,
            juzaAyaCount: 5,
            swraId: 11,
            nextSwraName: "",
            swraName: "هود",
            place: "مكية",
            ayaCount: "123 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
