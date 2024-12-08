import 'package:com.app.aboelazayem/new_screens/new_tafser_koran/new_tafser_koran_book.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/services/services_v2.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'new_tafser_koran_swar.dart';

class NewTafserKoranCategory extends StatelessWidget {
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
                  right: MediaQuery.of(context).size.width / 3.7,
                  top: MediaQuery.of(context).size.height / 17),
              width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height / 13,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: kSecondryColor))),
              child: AutoSizeText(
                'تفسير القرأن الكريم للإمام محمد ماضي أبو العزائم ',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff444444),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
          FutureBuilder(
              future: ServicesV2().getTafsirImamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3),
                    child: SpinKitFoldingCube(
                      color: Colors.green,
                      size: 60.0,
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
                // List categryData = snapshot.data;
                List<dynamic> categryData = snapshot.data as List<dynamic>;
                return Positioned(
                    top: MediaQuery.of(context).size.height / 6,
                    child: Container(
                        // width: SizeConfig.screenWidth * .9,
                        width: MediaQuery.of(context).size.width * .9,
                        // height: SizeConfig.screenHeight * .75,
                        height: MediaQuery.of(context).size.height * .75,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          border: Border.all(width: 1, color: kSecondryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Scrollbar(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, top: 1),
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1.0,
                              scrollDirection: Axis.vertical,
                              children:
                                  List.generate(categryData.length, (index) {
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
                                                widget: NewTafserKoranSwar(
                                                    categryData[index]
                                                        .tafsir_book)));
                                      }
                                    });
                                    Navigator.push(
                                        context,
                                        TransitionPageRoute(
                                            widget: NewTafserKoranSwar(
                                                categryData[index]
                                                    .tafsir_book)));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: kSecondryColor),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: AutoSizeText(
                                      translator.currentLanguage == 'ar'
                                          ? '${categryData[index].name_ar}'
                                          : '${categryData[index].name_en}',
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                      maxFontSize: 13,
                                      minFontSize: 7,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        )));
              }),
        ]))),
      ),
    );
  }
}
