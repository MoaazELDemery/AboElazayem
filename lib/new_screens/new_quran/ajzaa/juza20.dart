import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza20 extends StatefulWidget {
  @override
  _AyatFromJuza20State createState() => _AyatFromJuza20State();
}

class _AyatFromJuza20State extends State<AyatFromJuza20> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 56,
            juzaCat: true,
            juzaAyaCount: 93,
            swraId: 27,
            nextSwraName: "",
            swraName: "النمل",
            place: "مكية",
            ayaCount: "93 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 88,
            swraId: 28,
            nextSwraName: "",
            swraName: "القصص",
            place: "مكية",
            ayaCount: "88 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 45,
            swraId: 29,
            nextSwraName: "",
            swraName: "العنكبوت",
            place: "مكية ",
            ayaCount: "69 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
