import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza6 extends StatefulWidget {
  @override
  _AyatFromJuza6State createState() => _AyatFromJuza6State();
}

class _AyatFromJuza6State extends State<AyatFromJuza6> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 148,
            juzaCat: true,
            juzaAyaCount: 176,
            swraId: 4,
            nextSwraName: "",
            swraName: "النساء",
            place: "مدنية",
            ayaCount: "176 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 81,
            swraId: 5,
            nextSwraName: "",
            swraName: "المائدة",
            place: "مدنية",
            ayaCount: "120 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
