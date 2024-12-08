import 'package:com.app.aboelazayem/model/kasaed_model.dart';
import 'package:com.app.aboelazayem/model/poem_model.dart';
import 'package:com.app.aboelazayem/services/services.dart';
import 'package:com.app.aboelazayem/tester/poem_audio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:com.app.aboelazayem/model/kasaed_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:share/share.dart';

import '../constants.dart';
import '../size_config.dart';

class PoemScreen extends StatefulWidget {
  final List poemList;
  final int id;

  const PoemScreen(this.poemList, this.id);

  @override
  _PoemScreenState createState() => _PoemScreenState();
}

class _PoemScreenState extends State<PoemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Services().getPoemData(widget.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SpinKitFoldingCube(
                color: Colors.green,
                size: 50.0,
              );
            }
            Poem poemData = snapshot.data[0][0];
            List poemVerse = snapshot.data[1];
            List explain = snapshot.data[2];
            List listenPoem = snapshot.data[3];

            return SingleChildScrollView(
              child: Column(
                children: [
                  //------! custom header !----------//
                  Container(
                    color: kSecondryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.share_sharp,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () => Share.share(
                              "visit our website https://aboelazayem-universty.com/ar "),
                        ),
                        Text(
                          "القصائد والمواجيد ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 35,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                  //-------- ! poem details ------//
                  ExpansionTile(
                    tilePadding: EdgeInsets.all(15),
                    backgroundColor: Colors.white70,
                    title: Container(
                      child: Column(
                        crossAxisAlignment: translator.currentLanguage == 'ar'
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Text(
                            translator.currentLanguage == 'ar'
                                ? "وصف القصيدة "
                                : "Poem Descrition ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 150,
                                  width: MediaQuery.of(context).size.width / 12,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    margin: EdgeInsets.only(left: 5, right: 5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      Html(
                        data: "اسم القصيدة :   ${poemData.pname_ar}",
                      ),
                      Html(
                        data: "مناسبة القصيدة :   ${poemData.occasion_ar}",
                      ),
                      Html(
                        data: "مكان القصيدة :   ${poemData.place_ar}",
                      ),
                      Html(
                        data: "عدد الأبيات :   ${poemData.num_verses}",
                      ),
                      Html(
                        data: "راوي القصيد :   ${poemData.rawy_ar}",
                      ),
                      Html(
                        data: "بحر القصيدة :   ${poemData.name_sea}",
                      ),
                      Html(
                        data: "تاريخ هجري :   ${poemData.date_hijri}",
                      ),
                      Html(
                        data: "تاريخ ميلادي : ${poemData.date_birth}",
                      ),
                    ],
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kSecondryColor,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //-------------------- ألعنوان  ------------------------------//

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 10,
                    alignment: Alignment.center,

                    //  margin: EdgeInsets.only(top: 20, bottom: 20, right: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "${poemData.pname_ar}",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height:
                                    MediaQuery.of(context).size.height / 150,
                                width: MediaQuery.of(context).size.width / 12,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 150,
                                  width: MediaQuery.of(context).size.width / 4,
                                  margin: EdgeInsets.only(left: 5, right: 5)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /* ============================ الابيات ======================== */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      poemVerse.length,
                      (index) => FittedBox(
                        alignment: Alignment.center,
                        //    width: MediaQuery.of(context).size.width / 1,
                        //     padding: EdgeInsets.only(
                        //        right: 18, left: 18, top: 10, bottom: 10),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FittedBox(
                                    child: AutoSizeText(
                                      "${poemVerse[index].filter_right} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Text("::"),
                                  FittedBox(
                                    child: AutoSizeText(
                                      "${poemVerse[index].filter_left} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              )
                            ],
                          ),
                        ),
                      ),
                      // Divider(
                      //   thickness: 2,
                      //   color: kPrimaryColor,
                      // )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ExpansionTile(
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kSecondryColor,
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.white70,
                        title: Text(
                          translator.currentLanguage == 'ar'
                              ? "شرح القصيدة"
                              : "explain the poem ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        children: List.generate(
                          explain.length,
                          (index) => Html(
                              data: translator.currentLanguage == 'ar'
                                  ? "${explain[index].name_ar}  : ${explain[index].description_ar}"
                                  : "${explain[index].name_en}  : ${explain[index].description_en}"),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ExpansionTile(
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kSecondryColor,
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.white70,
                        title: Text(
                          " بيانات صوت القصيدة ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        children: List.generate(listenPoem.length, (index) {
                          return Column(
                            children: [
                              Text("الأسم :"),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Text("${listenPoem[index].name_ar}"),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Text("العنوان :"),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Text("${listenPoem[index].description_ar}"),
                            ],
                          );
                        }

                            //Html(
                            //  data:
                            //     "${listenPoem[index].name_ar}  : ${listenPoem[index].description_ar}"),
                            )),
                  ),
                  Container(
                    color: kPrimaryColor,
                    width: MediaQuery.of(context).size.width / 1.3,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: PoemAudio(listenPoem),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
