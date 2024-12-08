import 'dart:async';
import 'package:com.app.aboelazayem/SharedPreferences/shared_preferences.dart';
import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/new_screens/db/bookmark_db.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/splash/start_screen.dart';
import 'package:com.app.aboelazayem/SharedPreferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookMarkPref.init();
  await BookMarkDB().createDatabase();
  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar'],
    assetsDirectory: 'assets/lang/',
  );

  runApp(LocalizedApp(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'Abo ElAzayem',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              isAlwaysShown: false,
              thickness: MaterialStateProperty.all(8),
              thumbColor: MaterialStateProperty.all(Colors.grey),
              trackColor: MaterialStateProperty.all(Colors.grey[400]),
              radius: Radius.circular(10),
              minThumbLength: 100,
            ),
            primarySwatch: Colors.green,
            fontFamily: 'Cairo',
          ),
          home: MainSplashScreen(),

          localizationsDelegates:
              translator.delegates, // Android + iOS Delegates
          locale: translator.locale, // Active locale
          supportedLocales: translator.locals(),
        ),
      ),
    );
  }
}
