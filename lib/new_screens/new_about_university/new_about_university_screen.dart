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
import 'new_about_university_library.dart';

class NewAboutUniversityScreen extends StatelessWidget {
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
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 60),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 13,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                border: Border.all(width: 3, color: kSecondryColor),
                borderRadius: BorderRadius.circular(15)),
            child: FittedBox(
              fit: BoxFit.fill,
              child: AutoSizeText(
                'عن جامعة الإمام محمد ماضي أبو العزائم',
                maxLines: 2,
                style: TextStyle(
                    color: Color(0xff444444),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
          ),
          FutureBuilder(
              future: ServicesV2().getAboutUniversityData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3),
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
                        top: MediaQuery.of(context).size.height / 3,
                        left: 3,
                        right: 3),
                    child: Text(
                      "لا يوجد بيانات ",
                      style: TextStyle(
                          color: kSecondryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }
                List<dynamic> universityTextData = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 150, left: 3, right: 2),
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.6),
                      border: Border.all(width: 3, color: kSecondryColor)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: universityTextData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              translator.currentLanguage == 'ar'
                                  ? "${universityTextData[index].name_ar}"
                                  : "${universityTextData[index].name_en}",
                              style: TextStyle(
                                  color: Color(0xff444444),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Container(
                            child: Html(
                              data: translator.currentLanguage == 'ar'
                                  ? universityTextData[index].description_ar
                                  : universityTextData[index].description_en,
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
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 16,
              right: MediaQuery.of(context).size.width / 15,
              child: InkWell(
                onTap: () {
                  Provider.of<MainProvider>(context, listen: false)
                      .checkInternet()
                      .then((value) {
                    if (value == true) {
                      Navigator.push(
                          context,
                          TransitionPageRoute(
                              widget: NewAboutUniversityLibrary()));
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.17,
                  height: MediaQuery.of(context).size.height / 13,
                  decoration: BoxDecoration(
                      color: kSecondryColor,
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: AutoSizeText(
                    'كتب عن جامعة الإمام محمد ماضي أبو العزائم',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ]))),
      ),
    );
  }
}
