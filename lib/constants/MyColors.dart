import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static Color primary = Color(0xffdaa51e);
  static Color secondary = Colors.white;
  static Color gold = Color(0xffe4aa69);
  static Color grey = Colors.grey;
  static Color greyWhite = Color(0xfff3f3f3);
  static Color black = Color(0xff313135);
  static Color blackOpacity = Colors.black54;
  static Color white = Colors.white;
  static Color filledColor = Color(0xffced5e5);
  static Color notifyColor = Color(0xff5cb2c1);

  static setColors({Color? primaryColor, Color? secondaryColor}) {
    primary = primaryColor!;
    secondary = secondaryColor!;
  }
}
