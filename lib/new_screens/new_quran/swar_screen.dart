import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/services/services.dart';
import 'package:com.app.aboelazayem/tester/single_audio_player_tester.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../new_quran/quran_api.dart';
import 'ayat_from_swar_screen.dart';
import 'quran_api.dart';

class SwarScreen extends StatefulWidget {
  @override
  _SwarScreenState createState() => _SwarScreenState();
}

class _SwarScreenState extends State<SwarScreen> {
  List<Map<String, dynamic>> foundSurah = [];
  List ids = [];
  List indexx = [];
  @override
  void initState() {
    foundSurah = surah;
    for (int i = 0; i < surah.length; i++) {
      ids.add(surah[i]['id']);
      indexx.add(i);
    }
    // TODO: implement initState
    super.initState();
  }

// This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = surah;
    } else {
      ids = [];
      foundSurah = [];
      indexx = [];
      for (int i = 0; i < surah.length; i++) {
        if (surah[i]["name_ar"]
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase())) {
          foundSurah.add(surah[i]);
          ids.add(surah[i]['id']);
          indexx.add(i);
        }
      }
      // results = surah
      //     .where((surahItem) => surahItem["name_ar"]
      //         .toLowerCase()
      //         .contains(enteredKeyword.toLowerCase()))
      //     .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      // foundSurah = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/pattern-2.png',
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: double.infinity,
                color: kSecondryColor,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 100),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            "السور",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 100),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'إبحث بإسم السورة ',
                          hintStyle: TextStyle(color: Color(0xffdaa51e)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.27,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: foundSurah.length,
                  itemBuilder: (context, index) {
                    return foundSurah.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  TransitionPageRoute(
                                      widget: AyatFromSwarScreen(
                                    juzaCat: false,
                                    // scrollId: 1,
                                    swraId: ids[index],
                                    swraName: surah[indexx[index]]['name_ar'],
                                    nextSwraName: surah[indexx[index] + 1]
                                        ['name_ar'],
                                    nextPlace: surah[indexx[index] + 1]
                                        ['place_ar'],
                                    place: surah[indexx[index]]['place_ar'],

                                    ayaCount: int.parse(surah[indexx[index] + 1]
                                                    ["aya"]
                                                .toString()) >
                                            10
                                        ? "${surah[indexx[index]]['aya']} أية "
                                        : "${surah[indexx[index]]['aya']} أيات ",
                                    nextAyaCount: int.parse(
                                                surah[indexx[index] + 1]["aya"]
                                                    .toString()) >
                                            10
                                        ? "${surah[indexx[index] + 1]['aya']} أية "
                                        : "${surah[indexx[index] + 1]['aya']} أيات ",
                                    // scrollId: 100,
                                  )));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.fromBorderSide(BorderSide(
                                      color: kPrimaryColor.withOpacity(0.3)))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 100,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    child: Text(
                                      '${foundSurah[index]['id']}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: kSecondryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "سورة ${foundSurah[index]['name_ar']} (${foundSurah[index]['place_ar']})",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: kSecondryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Text(
                                      int.parse(surah[index]["aya"]
                                                  .toString()) >
                                              10
                                          ? "${foundSurah[index]['aya']} أية "
                                          : "${foundSurah[index]['aya']} أيات ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: kSecondryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 11,
                                    child: IconButton(
                                      onPressed: () {
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (ctx) {
                                              return CupertinoActionSheet(
                                                title: Text(
                                                  'إختر شيخ ',
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                cancelButton:
                                                    CupertinoActionSheetAction(
                                                  onPressed: () {
                                                    Navigator.pop(ctx);
                                                  },
                                                  child: Text('إلغاء',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                ),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Provider.of<MainProvider>(
                                                                context,
                                                                listen: false)
                                                            .checkInternet()
                                                            .then((value) {
                                                          if (value == true) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (ctx) {
                                                                  return AlertDialog(
                                                                    // title: Text(
                                                                    //   'سورة ${foundSurah[index]['name_ar']} محمود خليل الحصري ',
                                                                    //   style: TextStyle(
                                                                    //       fontSize:
                                                                    //           15),
                                                                    // ),
                                                                    content:
                                                                        FutureBuilder(
                                                                      future: Services().getQuranVoice(
                                                                          foundSurah[index]
                                                                              [
                                                                              'id']),
                                                                      builder: (context,
                                                                          AsyncSnapshot
                                                                              snapshot) {
                                                                        if (snapshot.connectionState !=
                                                                            ConnectionState.done) {
                                                                          return Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 200),
                                                                            child:
                                                                                SpinKitFoldingCube(
                                                                              color: Colors.green,
                                                                              size: 50.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                        // SwarNames suraName = snapshot.data[0];
                                                                        List
                                                                            shikhNames =
                                                                            snapshot.data[1];
                                                                        String
                                                                            value =
                                                                            snapshot.data[2];
                                                                        return SingleAudioPlayerTester(
                                                                            shikhNames[179],
                                                                            value);

                                                                        // Text(
                                                                        //     "${shikhNames[179].server}/$value.mp3");
                                                                      },
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(ctx);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'إلغاء',
                                                                            style:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          }
                                                        });
                                                      },
                                                      child: Text(
                                                          'محمود خليل الحصري (رواية : المصحف المجود)')),
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Provider.of<MainProvider>(
                                                                context,
                                                                listen: false)
                                                            .checkInternet()
                                                            .then((value) {
                                                          if (value == true) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (ctx) {
                                                                  return AlertDialog(
                                                                    // title: Text(
                                                                    //   'سورة ${foundSurah[index]['name_ar']} محمود خليل الحصري ',
                                                                    //   style: TextStyle(
                                                                    //       fontSize:
                                                                    //           15),
                                                                    // ),
                                                                    content:
                                                                        FutureBuilder(
                                                                      future: Services().getQuranVoice(
                                                                          foundSurah[index]
                                                                              [
                                                                              'id']),
                                                                      builder: (context,
                                                                          AsyncSnapshot
                                                                              snapshot) {
                                                                        if (snapshot.connectionState !=
                                                                            ConnectionState.done) {
                                                                          return Container(
                                                                            child:
                                                                                SpinKitFoldingCube(
                                                                              color: Colors.green,
                                                                              size: 50.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                        // SwarNames suraName = snapshot.data[0];
                                                                        List
                                                                            shikhNames =
                                                                            snapshot.data[1];
                                                                        String
                                                                            value =
                                                                            snapshot.data[2];
                                                                        return SingleAudioPlayerTester(
                                                                            shikhNames[13],
                                                                            value);

                                                                        //Text(
                                                                        //   "${shikhNames[13].server}/$value.mp3");
                                                                      },
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(ctx);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'إلغاء',
                                                                            style:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          }
                                                        });
                                                      },
                                                      child: Text(
                                                          'أحمد نعينع (رواية : حفص عن عاصم)')),
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Provider.of<MainProvider>(
                                                                context,
                                                                listen: false)
                                                            .checkInternet()
                                                            .then((value) {
                                                          if (value == true) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (ctx) {
                                                                  return AlertDialog(
                                                                    // title: Text(
                                                                    //   'سورة ${foundSurah[index]['name_ar']} محمود خليل الحصري ',
                                                                    //   style: TextStyle(
                                                                    //       fontSize:
                                                                    //           15),
                                                                    // ),
                                                                    content:
                                                                        FutureBuilder(
                                                                      future: Services().getQuranVoice(
                                                                          foundSurah[index]
                                                                              [
                                                                              'id']),
                                                                      builder: (context,
                                                                          AsyncSnapshot
                                                                              snapshot) {
                                                                        if (snapshot.connectionState !=
                                                                            ConnectionState.done) {
                                                                          return Container(
                                                                            margin:
                                                                                EdgeInsets.only(top: 200),
                                                                            child:
                                                                                SpinKitFoldingCube(
                                                                              color: Colors.green,
                                                                              size: 50.0,
                                                                            ),
                                                                          );
                                                                        }
                                                                        // SwarNames suraName = snapshot.data[0];
                                                                        List
                                                                            shikhNames =
                                                                            snapshot.data[1];
                                                                        String
                                                                            value =
                                                                            snapshot.data[2];
                                                                        return SingleAudioPlayerTester(
                                                                            shikhNames[168],
                                                                            value);

                                                                        //Text(
                                                                        //"${shikhNames[168].server}/$value.mp3");
                                                                      },
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(ctx);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'إلغاء',
                                                                            style:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          }
                                                        });
                                                      },
                                                      child: Text(
                                                          'محمد صديق المنشاوي (رواية : المصحف المجود)'))
                                                ],
                                              );
                                            });
                                      },
                                      iconSize: 30,
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: kSecondryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            child: Text(
                              "غير متاح نتائج للبحث ",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
