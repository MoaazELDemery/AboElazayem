import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:flutter/material.dart';

import '../quran_api.dart';

class AyatFromJuza29 extends StatefulWidget {
  @override
  _AyatFromJuza29State createState() => _AyatFromJuza29State();
}

class _AyatFromJuza29State extends State<AyatFromJuza29> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 30,
            swraId: 67,
            nextSwraName: "",
            swraName: "الملك",
            place: "مكية",
            ayaCount: "30 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 52,
            swraId: 68,
            nextSwraName: "",
            swraName: "القلم",
            place: "مكية",
            ayaCount: "52 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 52,
            swraId: 69,
            nextSwraName: "",
            swraName: "الحاقة",
            place: "مكية",
            ayaCount: "52 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 44,
            swraId: 70,
            nextSwraName: "",
            swraName: "المعارج",
            place: "مكية",
            ayaCount: "44 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 28,
            swraId: 71,
            nextSwraName: "",
            swraName: "نوح",
            place: "مكية",
            ayaCount: "28 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 28,
            swraId: 72,
            nextSwraName: "",
            swraName: "الجن",
            place: "مكية",
            ayaCount: "28 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 20,
            swraId: 73,
            nextSwraName: "",
            swraName: "المزمل",
            place: "مكية",
            ayaCount: "20 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 56,
            swraId: 74,
            nextSwraName: "",
            swraName: "المدثر",
            place: "مكية",
            ayaCount: "56 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 40,
            swraId: 75,
            nextSwraName: "",
            swraName: "القيامة",
            place: "مكية",
            ayaCount: "40 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 31,
            swraId: 76,
            nextSwraName: "",
            swraName: "الإنسان",
            place: "مدنية",
            ayaCount: "31 أية ",
            nextPlace: "",
            nextAyaCount: ""),
        AyatFromSwarScreen(
            juzaCat: true,
            juzaAyaCount: 50,
            swraId: 77,
            nextSwraName: "",
            swraName: "المرسلات",
            place: "مكية",
            ayaCount: "50 أية ",
            nextPlace: "",
            nextAyaCount: ""),
      ],
    ));
  }
}
