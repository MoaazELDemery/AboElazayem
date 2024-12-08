import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza7 extends StatefulWidget {
  @override
  _AyatFromJuza7State createState() => _AyatFromJuza7State();
}

class _AyatFromJuza7State extends State<AyatFromJuza7> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 82,
            juzaCat: true,
            juzaAyaCount: 120,
            swraId: 5,
            nextSwraName: "",
            swraName: "المائدة",
            place: "مدنية",
            ayaCount: "120 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 110,
            swraId: 6,
            nextSwraName: "",
            swraName: "الأنعام",
            place: "مكية",
            ayaCount: "165 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
