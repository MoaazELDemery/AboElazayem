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
import 'imam_student_audio_screen.dart';
import 'imam_student_data_screen.dart';
import 'imam_student_video_screen.dart';
import 'not_found_screen.dart';

class ImamStudentScreen extends StatelessWidget {
  final f = DateFormat('yyyy-MM-dd');
  final time = DateFormat('hh:mm a');
  final day = DateFormat('EEEE').format(DateTime.now());
  final _advancedDrawerController = AdvancedDrawerController();
  final String title;
  final int id;

  ImamStudentScreen({required this.title, required this.id});

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
            child: AutoSizeText(
              title,
              maxLines: 1,
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
              future: ServicesV2().getImamtext(id),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  print("snapshot is : ${snapshot.data}");
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 10),
                    child: SpinKitFoldingCube(
                      color: Colors.green,
                      size: 30.0,
                    ),
                  );
                }

                List imamtext = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: imamtext.length,
                  itemBuilder: (context, indeex) {
                    return Column(
                      children: [
                        Container(
                          child: Html(
                            data: translator.currentLanguage == 'ar'
                                ? imamtext[indeex].description_ar
                                : imamtext[indeex].description_en,
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
              child: Container(
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
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: FutureBuilder(
                          future: ServicesV2().getImamBtu(id),
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

                            List imamBtu = snapshot.data;
                            return GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.1,
                                scrollDirection: Axis.vertical,
                                children: List.generate(
                                    imamBtu.length,
                                    (index) => InkWell(
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
                                                        widget: imamBtu[index]
                                                                    .type ==
                                                                'pdf'
                                                            ? ImamStudentDataScreen(
                                                                title: translator
                                                                            .currentLanguage ==
                                                                        'ar'
                                                                    ? imamBtu[index]
                                                                        .name_ar
                                                                    : imamBtu[index]
                                                                        .name_en,
                                                                id: imamBtu[index]
                                                                    .id)
                                                            : imamBtu[index]
                                                                        .type ==
                                                                    'audio'
                                                                ? ImamStudentAudioScreen(
                                                                    title:
                                                                        title,
                                                                    id: imamBtu[index]
                                                                        .id)
                                                                : imamBtu[index]
                                                                            .type ==
                                                                        'video'
                                                                    ? ImamStudentVideoScreen(
                                                                        title:
                                                                            title,
                                                                        id: imamBtu[index].id)
                                                                    : NotFoundScreen()));
                                              }
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: kSecondryColor),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: AutoSizeText(
                                              translator.currentLanguage == 'ar'
                                                  ? imamBtu[index].name_ar
                                                  : imamBtu[index].name_en,
                                              maxFontSize: 25,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )));
                          }),
                    ),
                  ))),
        ]))),
      ),
    );
  }
}
