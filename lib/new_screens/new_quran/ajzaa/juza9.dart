import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza9 extends StatefulWidget {
  @override
  _AyatFromJuza9State createState() => _AyatFromJuza9State();
}

class _AyatFromJuza9State extends State<AyatFromJuza9> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 88,
            juzaCat: true,
            juzaAyaCount: 206,
            swraId: 7,
            nextSwraName: "",
            swraName: "الأعراف",
            place: "مكية",
            ayaCount: "206 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 40,
            swraId: 8,
            nextSwraName: "",
            swraName: "الأنفال",
            place: "مدنية",
            ayaCount: "75 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
