import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'ajzaa/juza1.dart';
import 'ajzaa/juza2.dart';
import 'ajzaa/juza21.dart';
import 'ajzaa/juza22.dart';
import 'ajzaa/juza23.dart';
import 'ajzaa/juza24.dart';
import 'ajzaa/juza25.dart';
import 'ajzaa/juza26.dart';
import 'ajzaa/juza27.dart';
import 'ajzaa/juza28.dart';
import 'ajzaa/juza29.dart';
import 'ajzaa/juza3.dart';
import 'ajzaa/juza30.dart';
import 'ajzaa/juza4.dart';
import 'ajzaa/juza5.dart';
import 'ajzaa/juza6.dart';
import 'ajzaa/juza7.dart';
import 'ajzaa/juza8.dart';
import 'ajzaa/juza9.dart';
import 'ajzaa/juza10.dart';
import 'ajzaa/juza11.dart';
import 'ajzaa/juza12.dart';
import 'ajzaa/juza13.dart';
import 'ajzaa/juza14.dart';
import 'ajzaa/juza15.dart';
import 'ajzaa/juza16.dart';
import 'ajzaa/juza17.dart';
import 'ajzaa/juza18.dart';
import 'ajzaa/juza19.dart';
import 'ajzaa/juza20.dart';

class AjzaMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondryColor,
          title: Center(
            child: Text(
              'الأجزاء ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          leading: SizedBox(
            width: 5,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/pattern-2.png',
                  ),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              /************************ الجزء 1 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza1()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١ البسملة أو (الحمد لله)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 2 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza2()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢ (سيقول السفهاء)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 3 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza3()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٣ (تلك الرسل)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 4 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza4()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٤ (لن تنالوا البر)/ (كل الطعام)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 5 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza5()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٥ (والمحصنات)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 6 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza6()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٦  (لا يحب الله)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 7 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza7()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٧  (لتجدن)/ (وإذا سمعوا)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 8 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza8()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٨ (ولو أننا نزلنا)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 9 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza9()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٩ (قال الملأ)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 10 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza10()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٠ (واعلموا)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 11 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza11()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١١ (إنما السبيل) ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 12 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza12()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٢  (ومامن دابة)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 13 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza13()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٣  (وما أبرئ نفسي)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 14 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza14()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٤ (الـر)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 13 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza13()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٥ (سبحان)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 16 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza16()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٦ (قال ألم)/ (أما السفينة)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 17 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza17()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٧ (اقترب للناس)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 18 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza18()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٨ (قد أفلح)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 19 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza19()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ١٩ (وقال الذين لا يرجون)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 20 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza20()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٠ (فما كان جواب قومه)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 21 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza21()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢١  (ولا تجادلوا)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 22 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza22()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٢  (ومن يقنت)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 23 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza23()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٣  (وما أنزلنا)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 24 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza24()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٤ (فمن أظلم)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 25 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza25()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٥ (إليه يرد)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 26 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza26()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٦  (حـم)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 27 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza27()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٧ (قال فما خطبكم)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 28 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza28()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٨  (قد سمع)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 29 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza29()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٢٩ (تبارك)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              /************************ الجزء 30 ******************************** */
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, TransitionPageRoute(widget: AyatFromJuza30()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  //margin: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondryColor, width: 1))),
                  child: Text(
                    "الجزء ٣٠ (عمّ)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
