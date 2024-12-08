import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/new_screens/db/bookmark_db.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'ayat_from_swar_screen.dart';
import 'quran_api.dart';

class BookMarkScreen extends StatefulWidget {
  @override
  _BookMarkScreenState createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future allCount = BookMarkDB().getAllCount().then((value) {
    if (value > 0) {
      return 1;
    } else {
      return 0;
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondryColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
          title: Container(
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 5),
            child: Text(
              "المراجع",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: InkWell(
              onTap: () async {
                List<Map> data = await BookMarkDB().getDataFromDatabase();
                print("data is : $data");
              },
              child: Container(
                color: kSecondryColor,
                width: MediaQuery.of(context).size.width / 12,
              )),
        ),
        body: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/pattern-2.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  FutureBuilder(
                      future: BookMarkDB().getAllCount(),
                      builder: (context, AsyncSnapshot snapshot) {
                        var allData = snapshot.data;
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Center(
                            child: SpinKitFoldingCube(
                              color: Colors.green,
                              size: 70.0,
                            ),
                          );
                        }
                        return allData > 0
                            ? InkWell(
                                onTap: () {
                                  BookMarkDB().deleteAll().then(
                                      (value) => print("all data deleted"));
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 9),
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'مسح كل المراجع ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: MediaQuery.of(context).size.height / 12,
                                child: Text(
                                  'لا يوجد مراجع فى الوقت الحالي ',
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: kSecondryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                      }),
                  FutureBuilder(
                      future: BookMarkDB().getDataFromDatabase(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 5),
                            child: SpinKitFoldingCube(
                              color: Colors.green,
                              size: 70.0,
                            ),
                          );
                        }
                        List<Map> data = snapshot.data;
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.34,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      TransitionPageRoute(
                                          widget: AyatFromSwarScreen(
                                              juzaCat: false,
                                              swraId: data[index]['swraId'],
                                              nextSwraName: data[index]
                                                  ['nextSwraName'],
                                              swraName: data[index]['swarName'],
                                              place: data[index]['place'],
                                              ayaCount: data[index]['ayaCount'],
                                              nextPlace: data[index]
                                                  ['nextAyaPlace'],
                                              nextAyaCount: data[index]
                                                  ['nextAyaCount'])));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              30,
                                      vertical:
                                          MediaQuery.of(context).size.height /
                                              100),
                                  //  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.2),
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'سورة ${getSurahNameAr(data[index]["swraId"])}',
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        80),
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                                decoration: BoxDecoration(
                                                    color: kSecondryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: AutoSizeText(
                                                  ' رقم السورة ${data[index]["swraId"]}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                                decoration: BoxDecoration(
                                                    color: kSecondryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: AutoSizeText(
                                                  ' رقم الأية ${data[index]["selected"] + 1}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  60),
                                          child: Text(
                                            '${getVerse(data[index]["swraId"], data[index]["selected"] + 1)}',
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                color: kSecondryColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          )),
        ));
  }
}
