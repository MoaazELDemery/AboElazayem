import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza8 extends StatefulWidget {
  @override
  _AyatFromJuza8State createState() => _AyatFromJuza8State();
}

class _AyatFromJuza8State extends State<AyatFromJuza8> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 111,
            juzaCat: true,
            juzaAyaCount: 165,
            swraId: 6,
            nextSwraName: "",
            swraName: "الأنعام",
            place: "مكية",
            ayaCount: "165 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 87,
            swraId: 7,
            nextSwraName: "",
            swraName: "الأعراف",
            place: "مكية",
            ayaCount: "206 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
