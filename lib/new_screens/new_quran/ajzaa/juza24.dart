import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza24 extends StatefulWidget {
  @override
  _AyatFromJuza24State createState() => _AyatFromJuza24State();
}

class _AyatFromJuza24State extends State<AyatFromJuza24> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 32,
            juzaCat: true,
            juzaAyaCount: 75,
            swraId: 39,
            nextSwraName: "",
            swraName: "الزمر",
            place: "مكية",
            ayaCount: "75 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 85,
            swraId: 40,
            nextSwraName: "",
            swraName: "غافر",
            place: "مكية",
            ayaCount: "85 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 46,
            swraId: 41,
            nextSwraName: "",
            swraName: "فصلت",
            place: "مكية",
            ayaCount: "54 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
