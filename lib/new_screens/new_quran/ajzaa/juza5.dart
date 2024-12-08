import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza5 extends StatefulWidget {
  @override
  _AyatFromJuza5State createState() => _AyatFromJuza5State();
}

class _AyatFromJuza5State extends State<AyatFromJuza5> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 24,
            juzaCat: true,
            juzaAyaCount: 123,
            swraId: 4,
            nextSwraName: " آل عمران",
            swraName: "النساء",
            place: "مدنية",
            ayaCount: "176 أية",
            nextPlace: "مدنية",
            nextAyaCount: "200 أية "),
      ],
    ));
  }
}
