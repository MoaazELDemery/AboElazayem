import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza1 extends StatefulWidget {
  @override
  _AyatFromJuza1State createState() => _AyatFromJuza1State();
}

class _AyatFromJuza1State extends State<AyatFromJuza1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 7,
            swraId: 1,
            nextSwraName: "",
            swraName: "الفاتحة",
            place: "مكية",
            ayaCount: "7 أيات",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 141,
            swraId: 2,
            nextSwraName: "",
            swraName: "البقرة",
            place: "مدنية",
            ayaCount: "286 أية",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
