import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/services/services_v2.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'new_videodetails_screen.dart';

class NewVideoScreen extends StatelessWidget {
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
                child: Stack(children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
          ),
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
                  ],
                ),
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
              "المرئيات ",
              style: TextStyle(
                  color: Color(0xff444444),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6, left: 3, right: 2),
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.6),
                border: Border.all(width: 3, color: kSecondryColor)),
            child: FutureBuilder(
              future: ServicesV2().getVideoMediaText(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 20),
                    child: SpinKitFoldingCube(
                      color: Colors.green,
                      size: 37.0,
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
                List mediaText = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: mediaText.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Html(
                        data: translator.currentLanguage == 'ar'
                            ? mediaText[index].description_ar
                            : mediaText[index].description_en,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2.7,
              child: Container(
                  // width: SizeConfig.screenWidth * .9,
                  width: MediaQuery.of(context).size.width* .9,
                  // height: SizeConfig.screenHeight * .57,
                  height: MediaQuery.of(context).size.height* .57,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    border: Border.all(width: 1, color: kSecondryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Scrollbar(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FutureBuilder(
                          future: ServicesV2().getVideoButtonLibrary(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 5),
                                child: SpinKitFoldingCube(
                                  color: Colors.green,
                                  size: 50.0,
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 3),
                                child: Text(
                                  "لا يوجد بيانات ",
                                  style: TextStyle(
                                      color: kSecondryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                            List buttonLibrary = snapshot.data;

                            return GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              scrollDirection: Axis.vertical,
                              children:
                                  List.generate(buttonLibrary.length, (index) {
                                return InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {
                                    Provider.of<MainProvider>(context,
                                            listen: false)
                                        .checkInternet()
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.push(
                                            context,
                                            TransitionPageRoute(
                                                widget: NewVideoDetailsScreen(
                                              videoList:
                                                  buttonLibrary[index].video,
                                              title: translator
                                                          .currentLanguage ==
                                                      'ar'
                                                  ? buttonLibrary[index].name_ar
                                                  : buttonLibrary[index]
                                                      .name_en,
                                            )));
                                      }
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: kSecondryColor),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: AutoSizeText(
                                      translator.currentLanguage == 'ar'
                                          ? buttonLibrary[index].name_ar
                                          : buttonLibrary[index].name_en,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                    ),
                  )))
        ]))),
      ),
    );
  }
}
