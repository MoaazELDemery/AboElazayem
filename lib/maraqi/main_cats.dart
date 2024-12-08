import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../services/services_v2.dart';
import '../ui/drawer_widget.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'sub_cate_screen.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../size_config.dart';

class MainCateScreen extends StatelessWidget {
  static String routeName = '/maraqi';
  final f = DateFormat('yyyy-MM-dd');
  final time = DateFormat('hh:mm a');
  final day = DateFormat('EEEE').format(DateTime.now());
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    var _today = HijriCalendar.now();

    return AdvancedDrawer(
      backdropColor: kSecondryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: true,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
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

                          Row(
                            children: [
                              Text(
                                _today.toFormat("dd MMMM yyyy"),
                                style: kTimeStyle,
                              ),
                              Text(
                                "${translator.translate("time_type")}",
                                style: kTimeStyle,
                              ),
                            ],
                          ),

                          IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: kSecondryColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                          // SizedBox(
                          //   width: 50,
                          // ),
                          // StatefulBuilder(
                          //   builder: (context, setter) {
                          //     return Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //       children: [
                          //         SizedBox(
                          //           width: 5,
                          //         ),
                          //         CupertinoSwitch(
                          //           activeColor: kPrimaryColor,
                          //           value: true,
                          //           onChanged: (val) {
                          //             setter(() {
                          //               translator.setNewLanguage(
                          //                 context,
                          //                 newLanguage:
                          //                     translator.currentLanguage == 'ar'
                          //                         ? 'en'
                          //                         : 'ar',
                          //                 restart: true,
                          //                 remember: true,
                          //               );
                          //             });

                          //             _switchValue = val;
                          //           },
                          //         ),
                          //         SizedBox(
                          //           width: 5,
                          //         ),
                          //         Text(
                          //           "عربي/en",
                          //           style: TextStyle(
                          //               fontSize: 15, color: Colors.white),
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // )
                        ],
                      ),
                      //    SizedBox(height: MediaQuery.of(context).size.height / 20),
                      // Row(
                      //   children: [
                      //     Text(
                      //       day,
                      //       style: kTimeStyle,
                      //     ),
                      //     SizedBox(width: 10),
                      //     Text(
                      //       f.format(
                      //         DateTime.now(),
                      //       ),
                      //       style: kTimeStyle,
                      //     ),
                      //   ],
                      // ),

                      // Text(
                      //   time.format(DateTime.now()),
                      //   style: kTimeStyle,
                      //   textAlign: TextAlign.left,
                      // ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 3.5,
                      top: MediaQuery.of(context).size.height / 13),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2, color: kSecondryColor))),
                  child: Text(
                    "${translator.translate("new_salken_title")}",
                    style: TextStyle(
                        color: Color(0xff444444),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6,
                      left: 3,
                      right: 2),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.6),
                      border: Border.all(width: 3, color: kSecondryColor)),
                  child: FutureBuilder(
                    future: ServicesV2().getMaraqiTextData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 10),
                          child: SpinKitFoldingCube(
                            color: Colors.green,
                            size: 40.0,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3),
                          child: Text(
                            "لا يوجد بيانات ",
                            style: TextStyle(
                                color: kSecondryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      List maraqiText = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: maraqiText.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  translator.currentLanguage == 'ar'
                                      ? maraqiText[index].name_ar
                                      : maraqiText[index].name_en,
                                  style: TextStyle(
                                      color: Color(0xff444444),
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Container(
                                child: Html(
                                  data: translator.currentLanguage == 'ar'
                                      ? maraqiText[index].description_ar
                                      : maraqiText[index].description_en,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Divider(
                                  thickness: 2,
                                  color: Color(0xff444444),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 1.9795,
                  child: Container(
                    width: SizeConfig.screenWidth! * .9,
                    height: SizeConfig.screenHeight! * .395,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: kSecondryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FutureBuilder(
                        future: Services().getMaraqiData(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return SpinKitFoldingCube(
                              color: Colors.green,
                              size: 50.0,
                            );
                          }
                          if (snapshot.hasError) {
                            return Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 3),
                              child: Text(
                                "لا يوجد بيانات ",
                                style: TextStyle(
                                    color: kSecondryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                          List maraqiData = snapshot.data; //all data
                          List mainCats = []; // filtered main data

                          maraqiData.forEach((cat) {
                            if (cat.parent_id == 0) {
                              mainCats.add(cat);
                            }
                          });

                          //filtered all data to recive main category in this screen

                          return Scrollbar(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                scrollDirection: Axis.vertical,
                                children:
                                    List.generate(mainCats.length, (index) {
                                  return InkWell(
                                    splashColor: Colors.green,
                                    onTap: () {
                                      Provider.of<MainProvider>(context,
                                              listen: false)
                                          .checkInternet()
                                          .then((value) {
                                        if (value == true) {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (_) {
                                            return SubCateScreen(
                                              maraqiModel: mainCats[
                                                  index], // id == 0 only
                                              MaraqiModelList:
                                                  maraqiData, //  all data
                                            );
                                          }));
                                        }
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: kSecondryColor),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            "${mainCats[index].img_path}" !=
                                                    null
                                                ? "${mainCats[index].img_path}"
                                                : '${translator.translate("not-found")}',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10,
                                          ),
                                          Text(
                                            translator.currentLanguage == 'ar'
                                                ? mainCats[index].name_ar ==
                                                        null
                                                    ? "${translator.translate("not-found")}"
                                                    : mainCats[index].name_ar
                                                : mainCats[index].name_en ==
                                                        null
                                                    ? "${translator.translate("not-found")}"
                                                    : mainCats[index].name_en,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
