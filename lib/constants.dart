import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 200);
const kTimeStyle = TextStyle(
  color: kSecondryColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
final headingStyle = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Color(0xFF333333),
  height: 1.5,
);
const defaultDuration = Duration(milliseconds: 250);
final kPrimaryColor = Color(0xffdaa51e);
const kSecondryColor = Color(0xFF0f873f);
final kMyBlack = Colors.yellow[800];
// Form Error
final RegExp userNameValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]");
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final String kEmailNullError = 'enter_mail';
final String kUserNameNullError = "enter_your_userName";
final String kInvalidEmailError = 'invalid_email';
final String kInvalidUserNameError = "enter_vaild_username";
final String kPassNullError = "please_enter_your_password";
final String kShortPassError = 'short_password';
final String kMatchPassError = 'password_dont_match';
final String kFNamelNullError = "enter_fname";
final String kaddressNullError = "ادخل العنوان";
final String kPhoneNumberNullError = "please_enter_your_phone";
final String kPhoneNumberInvalidError = "invalid_mobile_number";
final String kStoreNameNullError = 'enter_store_name';
const String imgUrl = 'https://gmhoria.ajathy.com/uploads/';
const String image = 'https://dashboard.elgmhoria.com/uploads/ads/';

const double kCustomBottomNavigationBarHeight = 70;
