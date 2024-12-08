import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza2 extends StatefulWidget {
  @override
  _AyatFromJuza2State createState() => _AyatFromJuza2State();
}

class _AyatFromJuza2State extends State<AyatFromJuza2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            scrollId: 142,
            juzaCat: true,
            juzaAyaCount: 286,
            swraId: 2,
            nextSwraName: "",
            swraName: "البقرة",
            place: "مدنية",
            ayaCount: "286 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
