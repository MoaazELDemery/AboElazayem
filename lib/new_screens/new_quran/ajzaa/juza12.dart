import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza12 extends StatefulWidget {
  @override
  _AyatFromJuza12State createState() => _AyatFromJuza12State();
}

class _AyatFromJuza12State extends State<AyatFromJuza12> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 6,
            juzaCat: true,
            juzaAyaCount: 123,
            swraId: 11,
            nextSwraName: "",
            swraName: "هود",
            place: "مكية",
            ayaCount: "123 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 52,
            swraId: 12,
            nextSwraName: "",
            swraName: "يوسف",
            place: "مكية",
            ayaCount: "111 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    );
  }
}
