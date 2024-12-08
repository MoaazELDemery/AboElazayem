import 'dart:io';
import 'dart:convert';
import 'package:com.app.aboelazayem/model/kasaed_model.dart';
import 'package:com.app.aboelazayem/model/poem_model.dart';
import 'package:com.app.aboelazayem/toras_nazmy/poem_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:share/share.dart';
import '../constants.dart';
import '../size_config.dart';

class NewSearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSearchScreenState();
  }
}

class NewSearchScreenState extends State<NewSearchScreen> {
  // GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  late String poemTitle; // إسم القصيدة

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
              })
        ],
        leading: Container(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // paginatorGlobalKey.currentState.changeState(
                            //     pageLoadFuture: (page) =>
                            //         sendCountriesDataRequest(page,
                            //             searchKey: poemTitle),
                            //     resetState: true);
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "ابحث فى القصائد والمواجيد ",
                      hintStyle: TextStyle(color: Colors.black54)),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              // child: Paginator.listView(
              //   shrinkWrap: true,
              //   key: paginatorGlobalKey,
              //   pageLoadFuture: sendCountriesDataRequest,
              //   pageItemsGetter: listItemsGetter,
              //   listItemBuilder: listItemBuilder,
              //   loadingWidgetBuilder: loadingWidgetMaker,
              //   errorWidgetBuilder: errorWidgetMaker,
              //   emptyListWidgetBuilder: emptyListWidgetMaker,
              //   totalItemsGetter: totalPagesGetter,
              //   pageErrorChecker: pageErrorChecker,
              //   scrollPhysics: BouncingScrollPhysics(),
              // ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // paginatorGlobalKey.currentState.changeState(
          //     pageLoadFuture: sendCountriesDataRequest, resetState: true);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Future<PoemsData> sendCountriesDataRequest(int page, {searchKey}) async {
    try {
      String url = Uri.encodeFull(
          "https://aboelazayem-universty.com/api/search?page=$page&format=json");
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode({
          "search": searchKey != null ? searchKey : '',
        }),
      );
      print("response ${response.body}");
      return PoemsData.fromResponse(response);
    } catch (e) {
      if (e is IOException) {
        return PoemsData.withError('Please check your internet connection.');
      } else {
        print(e.toString());
        return PoemsData.withError('Something went wrong. $e');
      }
    }
  }

  List<dynamic> listItemsGetter(PoemsData countriesData) {
    List<Widget> list = [];
    countriesData.poems!.forEach((value) {
      list.add(SearchCard(
        poemsList: countriesData.poems,
        poem: value,
      ));
    });
    return list;
  }

  Widget listItemBuilder(value, int index) {
    return value;
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(PoemsData countriesData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(countriesData.errorMessage!),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(PoemsData countriesData) {
    return Center(
      child: Text('No countries in the list'),
    );
  }

  int? totalPagesGetter(PoemsData countriesData) {
    return countriesData.total;
  }

  bool pageErrorChecker(PoemsData countriesData) {
    return countriesData.statusCode != 200;
  }
}

class PoemsData {
  List<dynamic>? poems;
  int? statusCode;
  String? errorMessage;
  int? total;
  int? nItems;

  PoemsData.fromResponse(http.Response response) {
    this.statusCode = response.statusCode;

    poems = json.decode(response.body)["data"].map((e) {
      return Kasaed.fromJson(e);
    }).toList();
    total = json.decode(response.body)['total'];
    nItems = poems!.length;
  }

  PoemsData.withError(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}

class SearchCard extends StatelessWidget {
  final poem;
  final List? poemsList;
  SearchCard({
    @required this.poem,
    required this.poemsList,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return PoemScreen(poemsList!, poem.id);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 100),
                Text(
                  " ${poem.num_peom}",
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
                poem.pname_ar,
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
  }
}
