import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza4 extends StatefulWidget {
  @override
  _AyatFromJuza4State createState() => _AyatFromJuza4State();
}

class _AyatFromJuza4State extends State<AyatFromJuza4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 93,
            juzaCat: true,
            juzaAyaCount: 200,
            swraId: 3,
            nextSwraName: "",
            swraName: "آل عمران",
            place: "مدنية",
            ayaCount: "200 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 23,
            swraId: 4,
            nextSwraName: "",
            swraName: "النساء",
            place: "مدنية",
            ayaCount: "176 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
