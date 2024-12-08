import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza13 extends StatefulWidget {
  @override
  _AyatFromJuza13State createState() => _AyatFromJuza13State();
}

class _AyatFromJuza13State extends State<AyatFromJuza13> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 53,
            juzaCat: true,
            juzaAyaCount: 111,
            swraId: 12,
            nextSwraName: "",
            swraName: "يوسف",
            place: "مكية",
            ayaCount: "111 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 43,
            swraId: 13,
            nextSwraName: "",
            swraName: "الرعد",
            place: "مدنية",
            ayaCount: "43 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 52,
            swraId: 14,
            nextSwraName: "",
            swraName: "إبراهيم",
            place: "مكية",
            ayaCount: "52 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
