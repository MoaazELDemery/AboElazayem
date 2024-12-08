import 'package:com.app.aboelazayem/SharedPreferences/shared_preferences.dart';
import 'package:com.app.aboelazayem/constants.dart';

import 'package:com.app.aboelazayem/model/kasaed_model.dart';
import 'package:com.app.aboelazayem/size_config.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:flutter_svg/svg.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:share/share.dart';
import './poem_screen.dart';

class Pages extends StatefulWidget {
  final List poems;

  const Pages(this.poems);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  // GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  List<Kasaed> poemList = [];
  @override
  void initState() {
    try {
      poemList = widget.poems.map((e) => Kasaed.fromJson(e)).toList();
    } catch (e) {
      print('there is an error $e');
    }

    super.initState();
  }

  int? bookmarked;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: SizeConfig.screenHeight * .1,
                height: MediaQuery.of(context).size.height* .1,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.share_sharp,
                        size: 30,
                        color: kSecondryColor,
                      ),
                      onPressed: () => Share.share(
                          "visit our website https://aboelazayem-universty.com/ar "),
                    ),
                    Text(
                      "${translator.translate("kasaed_title")}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 30,
                          color: kSecondryColor,
                        ),
                        onPressed: () => Navigator.pop(context))
                  ],
                ),
              ),
              Container(
                // height: SizeConfig.screenHeight * .8,
                height: MediaQuery.of(context).size.height* .8,
                child:
                    /* Paginator.listView(
                  key: paginatorGlobalKey,
                  pageLoadFuture: sendCountriesDataRequest,
                  pageItemsGetter: listItemsGetter,
                  listItemBuilder: listItemBuilder,
                  loadingWidgetBuilder: loadingWidgetMaker,
                  errorWidgetBuilder: errorWidgetMaker,
                  emptyListWidgetBuilder: emptyListWidgetMaker,
                  totalItemsGetter: totalPagesGetter,
                  pageErrorChecker: pageErrorChecker,
                ),*/
                    ListView.builder(
                  shrinkWrap: true,
                  itemCount: poemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return PoemScreen(poemList, poemList[index].id);
                        }));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        // height: SizeConfig.screenHeight * .2,
                        height: MediaQuery.of(context).size.height* .2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                              width: .5,
                            )),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Share.share(
                                      "visit our website https://aboelazayem-universty.com/ar "),
                                  child: Image.asset(
                                    'assets/images/share.png',
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    bookmarked =
                                        await BookMarkPref.setBookMarkValue(
                                            index);
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/bookmark.svg',
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    color:
                                        BookMarkPref.getBookMarkValue() == index
                                            ? kSecondryColor
                                            : Colors.black,
                                  ),
                                ),
                                SizedBox(width: 100),
                                Text(
                                  " ${poemList[index].num_peom}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                poemList[index].pname_ar,
                                style: TextStyle(
                                    color: kSecondryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
