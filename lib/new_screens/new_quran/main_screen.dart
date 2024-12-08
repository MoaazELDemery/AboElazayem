import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/new_screens/db/bookmark_db.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/ajza_main_screen.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/bookmark_screen.dart';

import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../size_config.dart';

import 'quran_search_screen.dart';
import 'swar_screen.dart';

class MainNewQuranScreen extends StatefulWidget {
  @override
  _MainNewQuranScreenState createState() => _MainNewQuranScreenState();
}

class _MainNewQuranScreenState extends State<MainNewQuranScreen> {
  String locale = 'ar';
  final f = DateFormat('yyyy-MM-dd');
  final time = DateFormat('hh:mm a');
  final day = DateFormat('EEEE').format(DateTime.now());
  // bool _switchValue;
  final _advancedDrawerController = AdvancedDrawerController();

  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(locale);
    SizeConfig().init(context);
    var _today = HijriCalendar.now();

    List<String> categoryName = ["السور", "الأجزاء", "المراجع", "بحث"];
    List<String> categoryIcon = [
      "swar.png",
      "ajza.png",
      "bookmark.png",
      "777.png"
    ];
    List<dynamic> categoryScreen = [
      SwarScreen(),
      AjzaMainScreen(),
      BookMarkScreen(),
      QuranSearchScreen()
    ];

    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: kSecondryColor,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: translator.currentLanguage == 'ar' ? true : false,
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
                      IconButton(
                        onPressed: () {
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
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 32,
                            color: kSecondryColor,
                          ))
                    ],
                  ),
                  Container(
                    margin: translator.currentLanguage == 'ar'
                        ? EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 4.8,
                            right: MediaQuery.of(context).size.width / 4,
                            left: 0)
                        : EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 4.8,
                            left: MediaQuery.of(context).size.width / 4,
                            right: 0),
                    child: Row(
                      children: [
                        Text(
                          _today.toFormat("dd MMMM yyyy"),
                          style: kTimeStyle,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${translator.translate("time_type")}",
                          style: kTimeStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: MediaQuery.of(context).size.width / 5,
                top: MediaQuery.of(context).size.height / 6.1,
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
                right: MediaQuery.of(context).size.width / 5.1,
                top: MediaQuery.of(context).size.height / 14,
                child: Container(
                  alignment: Alignment.center,
                  //   height: MediaQuery.of(context).size.height / 10,
                  child: AutoSizeText(
                    "علوم القرأن الكريم",
                    maxFontSize: 40,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                )),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.1,
              child: Container(
                width: SizeConfig.screenWidth! * .9,
                height: MediaQuery.of(context).size.height / 1.8,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 35,
                    vertical: MediaQuery.of(context).size.height / 35),
                decoration: BoxDecoration(
                    color: kSecondryColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: kSecondryColor)),
                child: GridView.count(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  children: List.generate(
                      4,
                      (index) => index == 2
                          ? FutureBuilder(
                              future: BookMarkDB().getAllCount(),
                              builder: (context, AsyncSnapshot snapshot) {
                                var allData = snapshot.data;
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return Center(
                                    child: SpinKitFoldingCube(
                                      color: Colors.green,
                                      size: 70.0,
                                    ),
                                  );
                                }
                                return GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        TransitionPageRoute(
                                            widget: categoryScreen[index]));
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                150),
                                    decoration: BoxDecoration(
                                        color: kSecondryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100),
                                          child: Image.asset(
                                            'assets/images/${categoryIcon[index]}',
                                            fit: BoxFit.fill,
                                            color: allData > 0
                                                ? Colors.red
                                                : Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                8,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: AutoSizeText(
                                            // "${routeNames[index]['name']}",
                                            categoryName[index],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  TransitionPageRoute(
                                      widget: categoryScreen[index])),
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        150),
                                decoration: BoxDecoration(
                                    color: kSecondryColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              100),
                                      child: Image.asset(
                                        'assets/images/${categoryIcon[index]}',
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: AutoSizeText(
                                        // "${routeNames[index]['name']}",
                                        categoryName[index],
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 23,
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
            )
          ],
        )),
      ),
    );
  }
}
