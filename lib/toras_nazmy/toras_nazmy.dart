import '../constants.dart';
import '../home_screen.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:share/share.dart';
import './pages.dart';

class TorasNazmy extends StatefulWidget {
  static String routeName = '/t_nazmy';

  @override
  _TorasNazmyState createState() => _TorasNazmyState();
}

class _TorasNazmyState extends State<TorasNazmy> {
  List data = [];
  bool loading = true;
  List rawy = [];
  late List poemData;
  @override
  void initState() {
    Services().getDropDown().then((value) {
      data = value;
      data.forEach((qa) {
        rawy.add(qa);
      });
      loading = false;

      setState(() {});
    });

    super.initState();
  }

  late String poemTitle; // إسم القصيدة
  /* poemWods, // البحث فى اى كلمة فى القصيدة
      poemOccasion, // مناسبة القصيدة
      poemPlace, // مكان القصيدة
      poemDate, // تاريخ القصيدة
      poemTeller; // اسم الراوي
      */
  // تابعة الى
  // var poemVersisNumber, poemNumber, poemType; // رقم القصيدة // عدد الابيات

  final _formKey = GlobalKey<FormState>();

  late HijriCalendar hijriDate;
  late DateTime miladiDate;

  var hijriDateNow = new HijriCalendar.now();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text(
          "${translator.translate("kasaed_title")}",
          style: TextStyle(
            color: kSecondryColor,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 30,
                color: kSecondryColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return HomeScreen();
                }));
              }),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.share_sharp,
            size: 30,
            color: kSecondryColor,
          ),
          onPressed: () => Share.share(
              "visit our website https://aboelazayem-universty.com/ar "),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //اسم القصيدة
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemTitle = value!;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "ابحث فى القصائد والمواجيد ",
                            labelText: "ابحث فى القصائد والمواجيد ",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    /*
                    // البحث فى اى كلمة فى القصيدة
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemWods = value;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${translator.translate("word_hint")}",
                            labelText: "${translator.translate("word_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    // رقم القصيدة
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          if (value != "") poemNumber = int.parse(value);
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${translator.translate("numPoem_hint")}",
                            labelText:
                                "${translator.translate("numPoem_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    // مناسبة القصيدة
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemOccasion = value;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:
                                "${translator.translate("occasion_hint")}",
                            labelText:
                                "${translator.translate("occasion_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null) {
                            return "you should add value";
                          }
                          return null;
                        },
                      ),
                    ),
                    // مكان القصيدة
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemPlace = value;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${translator.translate("place_hint")}",
                            labelText: "${translator.translate("place_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null) {
                            return "you should add value";
                          }
                          return null;
                        },
                      ),
                    ),
                    // عدد الابيات
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          if (value != "") poemVersisNumber = int.parse(value);
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:
                                "${translator.translate("numVerses_hint")}",
                            labelText:
                                "${translator.translate("numVerses_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    //التاريخ الميلادي والهجري
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemDate = value;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${translator.translate("date_label")}",
                            labelText: "${translator.translate("date_label")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    // إسم الراوي
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: TextFormField(
                        onSaved: (value) {
                          poemTeller = value;
                        },
                        cursorColor: kSecondryColor,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${translator.translate("rawyAr_hint")}",
                            labelText: "${translator.translate("rawyAr_hint")}",
                            hintStyle: TextStyle(color: Colors.black54)),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null) {
                            return "you should add value";
                          }
                          return null;
                        },
                      ),
                    ),
                    // تابعة إلى
                    Container(
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.only(top: 7, left: 10, right: 10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 236, 236, 0.3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: DropdownButton(
                        hint: Text("${translator.translate("rawy_type")}"),
                        value: poemType,
                        isExpanded: true,
                        onChanged: (newValue) {
                          setState(() {
                            poemType = newValue;
                          });
                        },
                        items: rawy.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem.id,
                            child: Text(
                              valueItem.rawy_ar,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: kSecondryColor),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                   */
                    //بحث
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    StatefulBuilder(builder: (context, setter) {
                      return isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  right: 40, left: 40, bottom: 30),
                              child: FlatButton(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  color: kSecondryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      setter(() {
                                        isLoading = true;
                                      });
                                      Services()
                                          .postSearch(
                                        search: poemTitle,
                                      )
                                          .then((value) {
                                        poemData = value['data'] != null
                                            ? value['data']
                                            : "can not find data ";
                                        setter(() {
                                          isLoading = false;
                                        });

                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return Pages(poemData);
                                        }));
                                      });
                                    }
                                  },
                                  child: Text(
                                    "${translator.translate("search_button")}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            );
                    }),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
