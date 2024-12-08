import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza17 extends StatefulWidget {
  @override
  _AyatFromJuza17State createState() => _AyatFromJuza17State();
}

class _AyatFromJuza17State extends State<AyatFromJuza17> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 112,
            swraId: 21,
            nextSwraName: "",
            swraName: "الأنبياء",
            place: "مكية",
            ayaCount: "112 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 78,
            swraId: 22,
            nextSwraName: "",
            swraName: "الحج",
            place: "مدنية",
            ayaCount: "78 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
