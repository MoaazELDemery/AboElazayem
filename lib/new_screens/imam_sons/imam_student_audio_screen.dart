import 'package:com.app.aboelazayem/services/services_v2.dart';
import 'package:com.app.aboelazayem/tester/audio_tester2.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../size_config.dart';

class ImamStudentAudioScreen extends StatefulWidget {
  final String title;
  final int id;

  ImamStudentAudioScreen({required this.title, required this.id});
  @override
  _ImamStudentAudioScreenState createState() => _ImamStudentAudioScreenState();
}

class _ImamStudentAudioScreenState extends State<ImamStudentAudioScreen> {
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
                decoration: BoxDecoration(),
                child: AutoSizeText(
                  "${translator.translate("new_audio_title")}",
                  maxLines: 1,
                  maxFontSize: 25,
                  minFontSize: 15,
                  style: TextStyle(
                      color: Color(0xff444444),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                height: MediaQuery.of(context).size.height / 1.3,
                child: FutureBuilder(
                  future: ServicesV2().getImamAudio(widget.id),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 5),
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
                    List audioData = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: audioData.length,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.only(left: 3, right: 2),
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.6),
                                    border: Border.all(
                                        width: 3, color: kSecondryColor)),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: AutoSizeText(
                                        translator.currentLanguage == 'ar'
                                            ? audioData[index].name_ar
                                            : audioData[index].name_en,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Color(0xff444444),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              180,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      child: ListView(children: [
                                        Html(
                                          data: translator.currentLanguage ==
                                                  'ar'
                                              ? audioData[index].description_ar
                                              : audioData[index].description_en,
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              AudioTesterv2(audioData[index]),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              )
                            ],
                          );
                        });
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
