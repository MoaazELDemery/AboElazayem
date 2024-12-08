import 'package:com.app.aboelazayem/maraqi/main_cats.dart';
import 'package:com.app.aboelazayem/model/maraqi_model.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/services/services.dart';
import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../size_config.dart';

class SubCateScreen extends StatefulWidget {
  final MaraqiModel? maraqiModel;
  final List? MaraqiModelList;
  SubCateScreen(
      {this.maraqiModel, // only id = 0
      this.MaraqiModelList // all from api
      });
  static String routeName = '/maraqi-post';

  @override
  _MaraqiPostState createState() => _MaraqiPostState();
}

class _MaraqiPostState extends State<SubCateScreen> {
  List<MaraqiModel> subcats = [];
  final f = DateFormat('yyyy-MM-dd');

  final time = DateFormat('hh:mm a');

  final day = DateFormat('EEEE').format(DateTime.now());
  @override
  void initState() {
    widget.MaraqiModelList!.forEach((cats) {
      if (cats.parent_id == widget.maraqiModel!.id) {
        subcats.add(cats);
      }
    });

    super.initState();
  }

  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    // print("${widget.maraqiModel.post}");
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
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 18,
                      child: Row(
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
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 11,
                child: Container(
                    width: SizeConfig.screenWidth! * .9,
                    height: SizeConfig.screenHeight! * .8,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: kSecondryColor)),
                    child: widget.maraqiModel!.post != null
                        ? ListView(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                //name
                                alignment: translator.currentLanguage == 'ar'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Text(
                                  translator.currentLanguage == 'ar'
                                      ? widget.maraqiModel!.post["name_ar"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!.post["name_ar"]
                                      : widget.maraqiModel!.post["name_en"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!.post["name_en"],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 4,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 4,
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    margin: EdgeInsets.only(right: 8),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              widget.maraqiModel!.post != null
                                  ? Container(
                                      child:
                                          widget.maraqiModel!.post["img_path"] ==
                                                  null
                                              ? Image.asset(
                                                  "assets/images/notFound.png")
                                              : Image.network(widget.maraqiModel!
                                                  .post["img_path"]),
                                    )
                                  : Text(
                                      "${translator.translate("post-not-found")}",
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                // title
                                alignment: translator.currentLanguage == 'ar'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Text(
                                  translator.currentLanguage == 'ar'
                                      ? widget.maraqiModel!.post["title_ar"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!.post["title_ar"]
                                      : widget.maraqiModel!.post["title_en"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!.post["title_en"],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 4,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 4,
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    margin: EdgeInsets.only(right: 8),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                // description

                                child: Text(
                                  translator.currentLanguage == 'ar'
                                      ? widget.maraqiModel!
                                                  .post["description_ar"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!
                                              .post["description_ar"]
                                      : widget.maraqiModel!
                                                  .post["description_en"] ==
                                              null
                                          ? "${translator.translate("post-not-found")}"
                                          : widget.maraqiModel!
                                              .post["description_en"],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                              GridView.count(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                scrollDirection: Axis.vertical,
                                children:
                                    List.generate(subcats.length, (index) {
                                  return InkWell(
                                    onTap: () {
                                      Provider.of<MainProvider>(context,
                                              listen: false)
                                          .checkInternet()
                                          .then((value) {
                                        if (value == true) {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (_) {
                                            return SubCateScreen(
                                              maraqiModel: subcats[index],
                                              MaraqiModelList:
                                                  widget.MaraqiModelList,
                                            );
                                          }));
                                        }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          // color: Color(0xFFFAFAFA),
                                          color:
                                              Colors.grey[300]!.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        translator.currentLanguage == 'ar'
                                            ? subcats[index].name_ar == null
                                                ? "${translator.translate("post-not-found")}"
                                                : subcats[index].name_ar
                                            : subcats[index].name_en == null
                                                ? "${translator.translate("post-not-found")}"
                                                : subcats[index].name_en,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )
                        : Text("${translator.translate("post-not-found")}")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
