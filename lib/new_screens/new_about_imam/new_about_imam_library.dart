import 'package:com.app.aboelazayem/model/model%20_version_2/about_imam_library_model.dart';
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
import 'new_about_imam_book.dart';

class NewAboutImamLibrary extends StatefulWidget {
  @override
  _NewAboutImamLibraryState createState() => _NewAboutImamLibraryState();
}

class _NewAboutImamLibraryState extends State<NewAboutImamLibrary> {
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
                reverse: true,
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
                        right: MediaQuery.of(context).size.width / 11,
                        top: MediaQuery.of(context).size.height / 17),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: kSecondryColor))),
                    child: AutoSizeText(
                      'كتب عن الإمام محمد مضي أبو العزائم ',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  FutureBuilder(
                    future: ServicesV2().getAboutImamLibrary(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 5),
                          child: SpinKitFoldingCube(
                            color: Colors.green,
                            size: 20.0,
                          ),
                        );
                      }
                      List<dynamic> libraryTextData = snapshot.data[0];

                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6,
                            left: 3,
                            right: 2),
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.6),
                            border:
                                Border.all(width: 3, color: kSecondryColor)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: libraryTextData.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    translator.currentLanguage == 'ar'
                                        ? "${libraryTextData[index].name_ar}"
                                        : "${libraryTextData[index].name_en}",
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
                                          ? libraryTextData[index]
                                              .description_ar
                                          : libraryTextData[index]
                                              .description_en),
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
                        ),
                      );
                    },
                  ),

/* ==================================== books Gridview================================== */
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.7,
                    child: FutureBuilder(
                      future: ServicesV2().getAboutImamLibrary(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.05,
                            alignment: Alignment.center,
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

                        List data = snapshot.data[1];
                        return Container(
                            width: SizeConfig.screenWidth! * .9,
                            height: SizeConfig.screenHeight! * .57,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              border:
                                  Border.all(width: 1, color: kSecondryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Scrollbar(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 10),
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.9,
                                  scrollDirection: Axis.vertical,
                                  children: List.generate(data.length, (index) {
                                    LibraryImamBookModel libraryData =
                                        data[index];
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
                                                    widget: NewAboutImamBook(
                                                  title: translator
                                                              .currentLanguage ==
                                                          'ar'
                                                      ? libraryData.name_ar
                                                      : libraryData.name_en,
                                                  pdfUrl: libraryData.pdf_path,
                                                )));
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
                                                width: 1,
                                                color: kSecondryColor),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            Image.network(
                                              "${libraryData.img_path}",
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                            ),
                                            AutoSizeText(
                                              translator.currentLanguage == 'ar'
                                                  ? '${libraryData.name_ar} '
                                                  : '${libraryData.name_en} ',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              maxFontSize: 13,
                                              minFontSize: 7,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
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
                ]))),
      ),
    );
  }
}
