import 'package:com.app.aboelazayem/model/model%20_version_2/imam_sons_model.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/services/services_v2.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'imam_student_screen.dart';

class ImamSonsAndStudentScreen extends StatefulWidget {
  @override
  _ImamSonsAndStudentScreenState createState() =>
      _ImamSonsAndStudentScreenState();
}

class _ImamSonsAndStudentScreenState extends State<ImamSonsAndStudentScreen> {
  final f = DateFormat('yyyy-MM-dd');

  final time = DateFormat('hh:mm a');

  final day = DateFormat('EEEE').format(DateTime.now());

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                right: MediaQuery.of(context).size.width / 3.5,
                top: MediaQuery.of(context).size.height / 13),
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: kSecondryColor))),
            child: Text(
              "أبناء الإمام و تلاميذه   ",
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
              future: ServicesV2().getImamSonsText(),
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
                List imamSonsabout = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: imamSonsabout.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            translator.currentLanguage == 'ar'
                                ? imamSonsabout[index].name_ar
                                : imamSonsabout[index].name_en,
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
                                ? imamSonsabout[index].description_ar
                                : imamSonsabout[index].description_en,
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
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.7,
            child: FutureBuilder(
              future: ServicesV2().getImamSonsLibrary(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.05,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
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

                List data = snapshot.data;
                return Container(
                    width: SizeConfig.screenWidth! * .9,
                    height: SizeConfig.screenHeight! * .57,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(width: 1, color: kSecondryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Scrollbar(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          scrollDirection: Axis.vertical,
                          children: List.generate(data.length, (index) {
                            ImamAboutTextModel buttuonTextData = data[index];
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
                                            widget: ImamStudentScreen(
                                          title:
                                              translator.currentLanguage == 'ar'
                                                  ? buttuonTextData.name_ar
                                                  : buttuonTextData.name_en,
                                          id: buttuonTextData.id,
                                        )));
                                  }
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: kSecondryColor),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      buttuonTextData.img_path,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                    ),
                                    Text(
                                      translator.currentLanguage == 'ar'
                                          ? buttuonTextData.name_ar
                                          : buttuonTextData.name_en,
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
                    ));
              },
            ),
          ),

          /*
          Positioned(
            top: MediaQuery.of(context).size.height / 2.58,
            right: MediaQuery.of(context).size.width / 6,
            child: Container(
              height: MediaQuery.of(context).size.height / 17,
              width: MediaQuery.of(context).size.width / 1.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kSecondryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: []),
              child: TextField(
                onChanged: (value) {
                  data = [];
                  translator.currentLanguage == 'ar'
                      ? books.forEach((element) {
                          if (element.name_ar.contains(value)) {
                            data.add(element);
                          }
                        })
                      : books.forEach((element) {
                          if (element.name_en != null) {
                            if (element.name_en.contains(value)) {
                              data.add(element);
                            }
                          } else {
                            print("data come with null data ");
                          }
                        });
                },
                decoration: InputDecoration(
                    hintText: "${translator.translate("search_title")} ....",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                    border: InputBorder.none),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      */
        ]))),
      ),
    );
  }
}
