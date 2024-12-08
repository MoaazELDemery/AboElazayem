import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../constants.dart';
import '../../size_config.dart';

class NewVideoDetailsScreen extends StatefulWidget {
  final List videoList;
  final String title;
  NewVideoDetailsScreen({required this.videoList, required this.title});
  @override
  _NewVideoDetailsScreenState createState() => _NewVideoDetailsScreenState();
}

class _NewVideoDetailsScreenState extends State<NewVideoDetailsScreen> {
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
    print("typeeee ${widget.videoList.runtimeType}");
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
                  widget.title,
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
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                ),
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.videoList.length,
                    itemBuilder: (ctx, index) {
                      var str = widget.videoList[index].video;
                      const start = 'src="';
                      const end = '"';
                      final startIndex = str.indexOf(start);
                      final endIndex =
                          str.indexOf(end, startIndex + start.length);
                      var url =
                          str.substring(startIndex + start.length, endIndex);
                      YoutubePlayerController _controller =
                          YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(url).toString(),
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                          disableDragSeek: false,
                          loop: false,
                          isLive: false,
                          forceHD: false,
                        ),
                      );
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.only(left: 3, right: 2),
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.6),
                                border: Border.all(
                                    width: 3, color: kSecondryColor)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: AutoSizeText(
                                    translator.currentLanguage == 'ar'
                                        ? widget.videoList[index].name_ar
                                        : widget.videoList[index].name_en,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Color(0xff444444),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 180,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 7.2,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Html(
                                        data: translator.currentLanguage == 'ar'
                                            ? widget
                                                .videoList[index].description_ar
                                            : widget.videoList[index]
                                                .description_en,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 4,
                            child: YoutubePlayer(
                              controller: _controller,
                              liveUIColor: kSecondryColor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          )
                        ],
                      );
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
