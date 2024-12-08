import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza25 extends StatefulWidget {
  @override
  _AyatFromJuza25State createState() => _AyatFromJuza25State();
}

class _AyatFromJuza25State extends State<AyatFromJuza25> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 47,
            juzaCat: true,
            juzaAyaCount: 54,
            swraId: 41,
            nextSwraName: "",
            swraName: "فصلت",
            place: "مكية",
            ayaCount: "54 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 53,
            swraId: 42,
            nextSwraName: "",
            swraName: "الشورى",
            place: "مكية",
            ayaCount: "53 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 89,
            swraId: 43,
            nextSwraName: "",
            swraName: "الزخرف",
            place: "مكية",
            ayaCount: "89 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 59,
            swraId: 44,
            nextSwraName: "",
            swraName: "الدخان",
            place: "مكية",
            ayaCount: "59 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            scrollId: 28,
            juzaCat: true,
            juzaAyaCount: 37,
            swraId: 45,
            nextSwraName: "",
            swraName: "الجاثية",
            place: "مكية",
            ayaCount: "37 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
