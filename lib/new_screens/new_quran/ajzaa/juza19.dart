import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza19 extends StatefulWidget {
  @override
  _AyatFromJuza19State createState() => _AyatFromJuza19State();
}

class _AyatFromJuza19State extends State<AyatFromJuza19> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 21,
            juzaCat: true,
            juzaAyaCount: 77,
            swraId: 25,
            nextSwraName: "",
            swraName: "الفرقان",
            place: "مكية",
            ayaCount: "77 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 227,
            swraId: 26,
            nextSwraName: "",
            swraName: "الشعراء",
            place: "مكية",
            ayaCount: "227 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 55,
            swraId: 27,
            nextSwraName: "",
            swraName: "النمل",
            place: "مكية",
            ayaCount: "93 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
