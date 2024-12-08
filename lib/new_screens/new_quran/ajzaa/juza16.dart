import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza16 extends StatefulWidget {
  @override
  _AyatFromJuza16State createState() => _AyatFromJuza16State();
}

class _AyatFromJuza16State extends State<AyatFromJuza16> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 75,
            juzaCat: true,
            juzaAyaCount: 110,
            swraId: 18,
            nextSwraName: "",
            swraName: "الكهف",
            place: "مكية",
            ayaCount: "110 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 98,
            swraId: 19,
            nextSwraName: "",
            swraName: "مريم",
            place: "مكية",
            ayaCount: "98 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 135,
            swraId: 20,
            nextSwraName: "",
            swraName: "طه",
            place: "مكية",
            ayaCount: "135 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
