import 'package:com.app.aboelazayem/model/model%20_version_2/tasof_model.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:com.app.aboelazayem/services/services_v2.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'new_tasof_book_screen.dart';

class NewTasofCategoryScreen extends StatefulWidget {
  final int id;
  NewTasofCategoryScreen({required this.id});

  @override
  _NewTasofCategoryScreenState createState() => _NewTasofCategoryScreenState();
}

class _NewTasofCategoryScreenState extends State<NewTasofCategoryScreen> {
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
            decoration: BoxDecoration(),
            child: AutoSizeText(
              "${translator.translate("new_nav_tasof")}",
              style: TextStyle(
                  color: Color(0xff444444),
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                  left: 3,
                  right: 2),
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.6),
                  border: Border.all(width: 3, color: kSecondryColor)),
              child: FutureBuilder(
                future: ServicesV2().getTasofLibraryData(widget.id),
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
                  List bookTestData = snapshot.data[0];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookTestData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              translator.currentLanguage == 'ar'
                                  ? bookTestData[index].name_ar
                                  : bookTestData[index].name_en,
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
                                  ? bookTestData[index].description_ar
                                  : bookTestData[index].description_en,
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
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 2.7,
              child: FutureBuilder(
                future: ServicesV2().getTasofLibraryData(widget.id),
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
                  List data = snapshot.data[1];
                  return Container(
                      // width: SizeConfig.screenWidth * .9,
                      width: MediaQuery.of(context).size.width * .9,
                      // height: SizeConfig.screenHeight * .57,
                      height: MediaQuery.of(context).size.height* .57,
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
                          padding: const EdgeInsets.only(top: 10),
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.9,
                            scrollDirection: Axis.vertical,
                            children: List.generate(data.length, (index) {
                              TasofLibraryBookModel bookData = data[index];
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
                                              widget: NewTasofBookScreen(
                                                  title: translator
                                                              .currentLanguage ==
                                                          "ar"
                                                      ? bookData.name_ar
                                                      : bookData.name_en,
                                                  pdfUrl: bookData.pdf_path)));
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: kSecondryColor),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Spacer(),
                                      Image.network(
                                        bookData.img_path,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                7.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                20,
                                        fit: BoxFit.contain,
                                      ),
                                      Spacer(flex: 2),
                                      Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Center(
                                            child: Text(
                                              translator.currentLanguage == 'ar'
                                                  ? bookData.name_ar
                                                  : bookData.name_en,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Spacer(flex: 3),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ));
                },
              )),
        ]))),
      ),
    );
  }
}
