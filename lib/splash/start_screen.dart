import 'dart:async';
import './info.dart';
import 'package:com.app.aboelazayem/constants.dart';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return Info();
      }));
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      child:

          // CircularProgressIndicator(
          //   backgroundColor: kPrimaryColor,
          // ),
          GestureDetector(
        onTap: () {
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          //   return Info();
          // }));
        },
        child: Container(
          height: double.infinity,
          child: Image.asset(
            "assets/images/splash.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    )));
  }
}
