import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza15 extends StatefulWidget {
  @override
  _AyatFromJuza15State createState() => _AyatFromJuza15State();
}

class _AyatFromJuza15State extends State<AyatFromJuza15> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 111,
            swraId: 17,
            nextSwraName: "",
            swraName: "الإسراء",
            place: "مكية",
            ayaCount: "111 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 74,
            swraId: 18,
            nextSwraName: "",
            swraName: "الكهف",
            place: "مكية",
            ayaCount: "110 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
