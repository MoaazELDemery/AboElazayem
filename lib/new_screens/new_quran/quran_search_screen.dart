import 'package:com.app.aboelazayem/model/model%20_version_2/quran_search_model.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/ayat_from_swar_screen.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/quran_api.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class QuranSearchScreen extends StatefulWidget {
  @override
  _QuranSearchScreenState createState() => _QuranSearchScreenState();
}

class _QuranSearchScreenState extends State<QuranSearchScreen> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List searchData = [];
  @override
  Widget build(BuildContext context) {
    String searchFieldValue =
        Provider.of<MainProvider>(context, listen: true).searchFieldValue!;

    search() {
      searchData = []; // List of object (List of Search Data Model )
      for (var item in quranAllVersesText) {
        if (item['standard'].contains(searchFieldValue)) {
          SearchDataModel object = SearchDataModel(
              verse_number: item['verse_number'],
              surah_number: item['surah_number'],
              content: item['content']);

          searchData.add(object);
        } else if (item['content'].contains(searchFieldValue)) {
          SearchDataModel object = SearchDataModel(
              verse_number: item['verse_number'],
              surah_number: item['surah_number'],
              content: item['content']);

          searchData.add(object);
        }
      }
    }

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
                height: MediaQuery.of(context).size.height / 7,
                width: double.infinity,
                color: kSecondryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(
                      //     top: MediaQuery.of(context).size.height / 100),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _textController,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            Provider.of<MainProvider>(context, listen: false)
                                .setSearchFieldValue(value);
                          },
                          onSaved: (val) {
                            print('saved$val');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'إدخل الأيه ';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    print(
                                        'searchFieldValue : $searchFieldValue');
                                    search();
                                    print(
                                        " dsdddddddd: ${searchData[0].verse_number} ");
                                  }
                                },
                                icon: Icon(
                                  Icons.search,
                                  color: kPrimaryColor,
                                  size: 30,
                                )),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'إبحث فى القرأن الكريم  ',
                            hintStyle: TextStyle(color: Color(0xffdaa51e)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      iconSize: 35,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: searchData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            TransitionPageRoute(
                                widget: AyatFromSwarScreen(
                                    juzaCat: false,
                                    scrollId: searchData[index].verse_number,
                                    swraId: searchData[index].surah_number,
                                    nextSwraName:
                                        "${getSurahNameAr(searchData[index].surah_number + 1)}",
                                    swraName:
                                        "${getSurahNameAr(searchData[index].surah_number)}",
                                    place:
                                        "${getPlace(searchData[index].surah_number)}",
                                    ayaCount: int.parse(
                                                surah[searchData[index].surah_number]
                                                        ["aya"]
                                                    .toString()) >
                                            10
                                        ? "${getVerseCount(searchData[index].surah_number)} أية "
                                        : "${getVerseCount(searchData[index].surah_number)} أيات ",
                                    nextPlace:
                                        "${getPlace(searchData[index].surah_number + 1)}",
                                    nextAyaCount: int.parse(surah[
                                                    searchData[index]
                                                            .surah_number +
                                                        1]["aya"]
                                                .toString()) >
                                            10
                                        ? "${getVerseCount(searchData[index].surah_number + 1)} أية "
                                        : "${getVerseCount(searchData[index].surah_number + 1)} أيات ")));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 30,
                            vertical: MediaQuery.of(context).size.height / 100),
                        //  width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.2),
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'سورة ${getSurahNameAr(searchData[index].surah_number)}',
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              80),
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              35,
                                      decoration: BoxDecoration(
                                          color: kSecondryColor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: AutoSizeText(
                                        ' رقم السورة ${searchData[index].surah_number}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      decoration: BoxDecoration(
                                          color: kSecondryColor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: AutoSizeText(
                                        ' رقم الأية ${searchData[index].verse_number}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ]),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 60),
                                child: Text(
                                  '${searchData[index].content}',
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}
