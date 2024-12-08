import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza3 extends StatefulWidget {
  @override
  _AyatFromJuza3State createState() => _AyatFromJuza3State();
}

class _AyatFromJuza3State extends State<AyatFromJuza3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 253,
            juzaCat: true,
            juzaAyaCount: 286,
            swraId: 2,
            nextSwraName: "",
            swraName: "البقرة",
            place: "مدنية",
            ayaCount: "286 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 92,
            swraId: 3,
            nextSwraName: "",
            swraName: "ال عمران ",
            place: "مكية",
            ayaCount: "200 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
