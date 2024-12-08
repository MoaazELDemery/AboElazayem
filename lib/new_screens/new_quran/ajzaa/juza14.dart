import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza14 extends StatefulWidget {
  @override
  _AyatFromJuza14State createState() => _AyatFromJuza14State();
}

class _AyatFromJuza14State extends State<AyatFromJuza14> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 99,
            swraId: 15,
            nextSwraName: "",
            swraName: "الحجر",
            place: "مكية",
            ayaCount: "99 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 128,
            swraId: 16,
            nextSwraName: "",
            swraName: "النحل",
            place: "مكية",
            ayaCount: "128 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
