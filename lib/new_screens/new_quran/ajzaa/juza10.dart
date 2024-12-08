import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza10 extends StatefulWidget {
  @override
  _AyatFromJuza10State createState() => _AyatFromJuza10State();
}

class _AyatFromJuza10State extends State<AyatFromJuza10> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 41,
            juzaCat: true,
            juzaAyaCount: 75,
            swraId: 8,
            nextSwraName: "",
            swraName: "الأنفال",
            place: "مدنية",
            ayaCount: "75 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 92,
            swraId: 9,
            nextSwraName: "",
            swraName: "التوبة",
            place: "مدنية",
            ayaCount: "129 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
