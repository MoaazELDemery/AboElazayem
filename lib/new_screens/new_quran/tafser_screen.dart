import 'package:flutter/material.dart';

import '../../constants.dart';
import 'quran_api.dart';

class NewTafserScreen extends StatefulWidget {
  final String title;
  final String tafser;
  final String sura;
  final int aya;

  const NewTafserScreen(
      {required this.title,
      required this.tafser,
      required this.sura,
      required this.aya});
  @override
  _NewTafserScreenState createState() => _NewTafserScreenState();
}

class _NewTafserScreenState extends State<NewTafserScreen> {
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
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 5),
          child: Text(
            "تفسير ${widget.title}",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        leading: SizedBox(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/pattern-2.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "سورة ${widget.sura}",
                        style: TextStyle(
                            color: kSecondryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "أية ${widget.aya}",
                        style: TextStyle(
                            color: kSecondryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  width: double.infinity,
                  child: SelectableText(
                    "${widget.tafser}",
                    style: TextStyle(
                        color: kSecondryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
