import 'package:com.app.aboelazayem/ui/drawer_widget.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ConverstionBokkScreen extends StatefulWidget {
  final String title;
  final String pdfUrl;

  const ConverstionBokkScreen({required this.title, required this.pdfUrl});

  @override
  _ConverstionBokkScreenState createState() => _ConverstionBokkScreenState();
}

class _ConverstionBokkScreenState extends State<ConverstionBokkScreen> {
  final f = DateFormat('yyyy-MM-dd');

  final time = DateFormat('hh:mm a');

  final day = DateFormat('EEEE').format(DateTime.now());

  final _advancedDrawerController = AdvancedDrawerController();

  bool _isLoading = true;
  PDFDocument? document;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      loadDocument(widget.pdfUrl);
    }
  }

  loadDocument(String url) async {
    if (mounted) {
      document = await PDFDocument.fromURL(widget.pdfUrl);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  changePDF(String url) async {
    if (mounted) {
      if (mounted) {
        setState(() => _isLoading = true);
      }
      document = await PDFDocument.fromURL(
        widget.pdfUrl,
      );
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              maxLines: 2,
              maxFontSize: 25,
              minFontSize: 15,
              style: TextStyle(
                  color: Color(0xff444444),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 6,
              child: Container(
                width: SizeConfig.screenWidth! * .9,
                height: SizeConfig.screenHeight! * .78,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  border: Border.all(width: 1, color: kSecondryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _isLoading
                    ? SpinKitFoldingCube(
                        color: Colors.green,
                        size: 50.0,
                      )
                    : Container(
                        color: Colors.green,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: PDFViewer(
                          document: document!,
                          pickerIconColor: kPrimaryColor,
                          pickerButtonColor: kSecondryColor,
                          zoomSteps: 1,
                        ),
                      ),
              )),
        ]))),
      ),
    );
  }
}
