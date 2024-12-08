import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import './constants.dart';
import './size_config.dart';
import 'magazine/magazine_screen.dart';
import 'maraqi/main_cats.dart';
import 'new_screens/imam_sons/imam_sons_and_students_screen.dart';
import 'new_screens/new_Tasof/new_tasof_screen.dart';
import 'new_screens/new_audio/new_audio_screen.dart';
import 'new_screens/new_quran/main_screen.dart';
import 'new_screens/new_video/new_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'toras_nazmy/pagination_serach_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locale = 'ar';
  final f = DateFormat('yyyy-MM-dd');
  final time = DateFormat('hh:mm a');
  final day = DateFormat('EEEE').format(DateTime.now());

  // bool _switchValue;
  final _advancedDrawerController = AdvancedDrawerController();

  DateTime timeBackPressed = DateTime.now();

  List<Map<String, dynamic>> routeNames = [
    {
      'screen': MainNewQuranScreen(),
      'name': translator.translate('new_quran_title'),
    },
    {
      'screen': MainCateScreen(),
      'name': translator.translate('new_salken_title')
    },
    {
      'screen': ImamSonsAndStudentScreen(),
      'name': translator.translate('imam_sons')
    },
    {
      'screen': NewTasofScreen(),
      'name': translator.translate('new_nav_tasof'),
    },
    {
      'screen': NewVideoScreen(),
      'name': translator.translate('new_video_title')
    },
    {
      'screen': NewAudioScreen(),
      'name': translator.translate('new_audio_title')
    },
    {'screen': NewSearchScreen(), 'name': 'القصائد والمواجيد'},
    {'screen': MagazineScreen(), 'name': translator.translate('magazine')}
  ];

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(locale);
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        final diffrence = DateTime.now().difference(timeBackPressed);
        final isExitWarning = diffrence >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = "${translator.translate('exit_message')}";
          Fluttertoast.showToast(
              msg: message,
              fontSize: 18,
              textColor: Colors.white,
              backgroundColor: kPrimaryColor);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: SafeArea(
        child: AdvancedDrawer(
          backdropColor: kSecondryColor,
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: true,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.0,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          drawer: MyDrawer(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: SizeConfig.screenWidth,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/pattern-2.png'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*   InkWell(
                            onTap: () {
                              print("taped");
                              _advancedDrawerController.value =
                                  AdvancedDrawerValue.visible();
                              _advancedDrawerController.showDrawer();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.red)),
                              child:
                                  ValueListenableBuilder<AdvancedDrawerValue>(
                                valueListenable: _advancedDrawerController,
                                builder: (_, value, __) {
                                  return AnimatedSwitcher(
                                    duration: Duration(milliseconds: 250),
                                    child: Icon(
                                      value.visible ? Icons.clear : Icons.menu,
                                      key: ValueKey<bool>(value.visible),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                       */
                          IconButton(
                            onPressed: () {
                              print("taped");
                              _advancedDrawerController.value =
                                  AdvancedDrawerValue.visible();
                              _advancedDrawerController.showDrawer();
                            },
                            color: kSecondryColor,
                            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible ? Icons.clear : Icons.menu,
                                    key: ValueKey<bool>(value.visible),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: MediaQuery.of(context).size.width / 40,
                    left: MediaQuery.of(context).size.width / 40,
                    top: MediaQuery.of(context).size.height / 35,
                    child: Container(
                      child: Image.asset(
                        "assets/images/imam2.png",
                        width: MediaQuery.of(context).size.width / 10,
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                    )),
                Positioned(
                    right: MediaQuery.of(context).size.width / 5,
                    top: MediaQuery.of(context).size.height / 4.4,
                    child: Container(
                        alignment: Alignment.center,
                        //   height: MediaQuery.of(context).size.height / 10,
                        child: Column(
                          children: [
                            AutoSizeText(
                              "جامعة الإمام محمد ماضي أبو العزائم",
                              maxFontSize: 16,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            AutoSizeText(
                              "لإحياء تراث السلف الصالح",
                              maxFontSize: 19,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ))),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.3,
                  child: Container(
                    width: SizeConfig.screenWidth! * .9,
                    height: MediaQuery.of(context).size.height / 1.55,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: kSecondryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: kSecondryColor)),
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      children: List.generate(
                          8,
                          (index) => GestureDetector(
                                onTap: () {
                                  if (index != 0) {
                                    Provider.of<MainProvider>(context,
                                            listen: false)
                                        .checkInternet()
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return routeNames[index]['screen'];
                                        }));
                                      }
                                    });
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return routeNames[index]['screen'];
                                    }));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kSecondryColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        'assets/images/${index + 1}.png',
                                        fit: BoxFit.fill,
                                        //  color: Colors.white,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                17,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: AutoSizeText(
                                          "${routeNames[index]['name']}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
