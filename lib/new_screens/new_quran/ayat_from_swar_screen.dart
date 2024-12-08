import 'dart:async';
import 'package:com.app.aboelazayem/new_screens/db/bookmark_db.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/quran_api.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/single_aya_audio.dart';
import 'package:com.app.aboelazayem/new_screens/new_quran/tafser_screen.dart';
import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:com.app.aboelazayem/ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class AyatFromSwarScreen extends StatefulWidget {
  final bool juzaCat;
  final int swraId;
  final String? nextSwraName;
  final String? nextPlace;
  final String? nextAyaCount;
  final String swraName;
  final String place;
  final String ayaCount;
  final int? scrollId;
  final int? juzaAyaCount;

  const AyatFromSwarScreen(
      {required this.juzaCat,
      required this.swraId,
      this.nextSwraName,
      required this.swraName,
      required this.place,
      required this.ayaCount,
      this.scrollId,
      this.nextPlace,
      this.nextAyaCount,
      this.juzaAyaCount});

  @override
  _AyatFromSwarScreenState createState() => _AyatFromSwarScreenState();
}

class _AyatFromSwarScreenState extends State<AyatFromSwarScreen> {
  Future<void> _launchInBrowser(String url) async {
    await launch(
      url,
    );
  }

  ItemScrollController? itemController;
  TextEditingController? _capertinoTextField;
  final itemListener = ItemPositionsListener.create();
  int? listIndex;
  bool _isBookMarkInit = true;

  Future scrollToItem() async {
    itemController!.scrollTo(
        index: listIndex! - 1, duration: Duration(seconds: 1));
  }

  Future scrollToItem2(inddex) async {
    itemController!.scrollTo(index: inddex, duration: Duration(seconds: 1));
  }

  bool loading = true;
  @override
  void initState() {
    itemController = ItemScrollController();
    _capertinoTextField = TextEditingController();
    listIndex = widget.scrollId;

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (mounted) {
      if (loading == true) {
        if (widget.scrollId != null && itemController!.isAttached) {
          itemController!.scrollTo(
              index: widget.scrollId! - 1,
              duration: Duration(milliseconds: 500));
          print(
              "itemController ${itemController!.isAttached} ${widget.scrollId}");

          if (mounted) {
            setState(() {
              loading = false;
            });
          }
        }
      }
    }
    if (mounted) {
      if (_isBookMarkInit) {
        for (int i = 0; i < getVerseCount(widget.swraId); i++) {
          int res =
              await BookMarkDB().getCount(selected: i, swraId: widget.swraId);
          bookmarks.add(res);
        }
      }

      if (mounted) {
        setState(() {
          _isBookMarkInit = false;
        });
      }
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _capertinoTextField!.dispose();
    itemListener.itemPositions.removeListener(() {});
    super.dispose();
  }

  // bool textClr = BookMarkPref.getBookMarkValue();
  bool isBokkMarkselected = false;
  List bookmarks = [];
  @override
  Widget build(BuildContext context) {
    bool isStart = Provider.of<MainProvider>(context, listen: true).start;
    bool isEnd = Provider.of<MainProvider>(context, listen: true).end;

    itemListener.itemPositions.addListener(() {
      final indices =
          itemListener.itemPositions.value.map((item) => item.index).toList();
      if (indices[0] >= 1) {
        Provider.of<MainProvider>(context, listen: false).setStartList(false);
      } else {
        Provider.of<MainProvider>(context, listen: false).setStartList(true);
      }

      if (indices[indices.length - 1] == getVerseCount(widget.swraId) - 1) {
        Provider.of<MainProvider>(context, listen: false).setEndList(true);
      } else {
        Provider.of<MainProvider>(context, listen: false).setEndList(false);
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondryColor,
          title:
              /**============================ AppBar ================================= */
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "سورة ${widget.swraName}  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 80),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 35,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(7)),
                child: AutoSizeText(
                  '${widget.place}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 35,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(7)),
                child: AutoSizeText(
                  '${widget.ayaCount}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                )),
          ],
          leading: widget.juzaCat == false
              ? IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (ctx) {
                          return CupertinoAlertDialog(
                            title: Text(
                              'إذهب إلى الأية',
                              style: TextStyle(
                                fontSize: 25,
                                color: kSecondryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              '  إدخل رقم الأية (1- ${getVerseCount(widget.swraId)})',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            actions: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 16,
                                child: CupertinoTextField(
                                  onChanged: (value) {
                                    setState(() {
                                      listIndex = int.parse(value);
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  controller: _capertinoTextField,
                                  placeholder:
                                      '(1- ${getVerseCount(widget.swraId)})',
                                ),
                              ),
                              CupertinoDialogAction(
                                onPressed: () {
                                  scrollToItem();
                                  Navigator.pop(ctx);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: kSecondryColor,
                                  child: Text(
                                    "إذهب",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: Container(
                    //   width: MediaQuery.of(context).size.width / 20,
                    child: Image.asset(
                      'assets/images/go.png',
                    ),
                  ))
              : Container(
                  width: 20,
                ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/pattern-2.png',
                ),
                fit: BoxFit.cover),
          ),
          child: _isBookMarkInit
              ? Center(
                  child: SpinKitFoldingCube(
                    color: Colors.green,
                    size: 70.0,
                  ),
                )
              : ListView(
                  children: [
/**============================ Basmala ================================= */
                    isStart == true
                        ? Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Image.asset(
                              'assets/images/basmla.png',
                              width: MediaQuery.of(context).size.width / 1.1,
                            ),
                          )
                        : SizedBox(
                            height: 5,
                          ),
/**============================ Ayat ================================= */
                    Container(
                      height: MediaQuery.of(context).size.height / 1.24,
                      child: ScrollablePositionedList.builder(
                        itemScrollController: itemController,
                        itemCount: widget.juzaCat == false
                            ? getVerseCount(widget.swraId)
                            : widget.juzaAyaCount!,
                        itemPositionsListener: itemListener,
                        itemBuilder: (context, index) {
                          int data = 0;
                          String getHusary(int index) {
                            String audioUrl = "";
                            if (widget.swraId <= 9 && widget.swraId > 0) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/00${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/00${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/00${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId <= 99 &&
                                widget.swraId >= 10) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/0${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/0${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/0${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId < 999 &&
                                widget.swraId >= 100) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Husary_128kbps/${widget.swraId}${index + 1}.mp3';
                              }
                            } else {
                              audioUrl = 'error';
                            }
                            return audioUrl;
                          }

                          String getNenea(int index) {
                            String audioUrl = "";
                            if (widget.swraId <= 9 && widget.swraId > 0) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/00${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/00${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/00${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId <= 99 &&
                                widget.swraId >= 10) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/0${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/0${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/0${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId < 999 &&
                                widget.swraId >= 100) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Ahmed_Neana_128kbps/${widget.swraId}${index + 1}.mp3';
                              }
                            } else {
                              audioUrl = 'error';
                            }
                            return audioUrl;
                          }

                          String getMenshawy(int index) {
                            String audioUrl = "";
                            if (widget.swraId <= 9 && widget.swraId > 0) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/00${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/00${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/00${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId <= 99 &&
                                widget.swraId >= 10) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/0${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/0${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/0${widget.swraId}${index + 1}.mp3';
                              }
                            } else if (widget.swraId < 999 &&
                                widget.swraId >= 100) {
                              if (index + 1 < 9 && index + 1 > 0) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/${widget.swraId}00${index + 1}.mp3';
                              } else if (index + 1 < 99 && index + 1 >= 10) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/${widget.swraId}0${index + 1}.mp3';
                              } else if (index + 1 < 999 && index + 1 >= 100) {
                                audioUrl =
                                    'https://everyayah.com/data/Minshawy_Mujawwad_192kbps/${widget.swraId}${index + 1}.mp3';
                              }
                            } else {
                              audioUrl = 'error';
                            }
                            return audioUrl;
                          }

                          return InkWell(
                            onTap: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (ctx) {
                                    return CupertinoActionSheet(
                                      cancelButton: CupertinoActionSheetAction(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: Text(
                                            'إلغاء',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      actions: [
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
                                            onPressed: () {
                                              Clipboard.setData(new ClipboardData(
                                                      text:
                                                          '${getVerse(widget.swraId, index + 1)}'))
                                                  .then((_) {
                                                Navigator.pop(ctx);
                                                Fluttertoast.showToast(
                                                    backgroundColor:
                                                        kPrimaryColor,
                                                    textColor: kSecondryColor,
                                                    msg: "تم نسخ الاية ");
                                              });
                                            },
                                            child: Text('نسخ')),
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
                                            onPressed: () {
                                              Share.share(
                                                  '${getVerseEndSymbol(index + 1)} ${getVerse(widget.swraId, index + 1)} https://play.google.com/store/apps/details?id=com.app.aboelazayem');
                                            },
                                            child: Text('مشاركة ')),
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
                                            onPressed: () async {
                                              data = await BookMarkDB()
                                                  .getCount(
                                                      selected: index,
                                                      swraId: widget.swraId);
                                              print("data is : $data");

                                              if (data == 0) {
                                                BookMarkDB().insertToDatabase(
                                                  scrollId: widget.scrollId!,
                                                  selected: index,
                                                  swraId: widget.swraId,
                                                  swarName: widget.swraName,
                                                  nextSwraName:
                                                      widget.nextSwraName!,
                                                  ayaCount: widget.ayaCount,
                                                  nextAyaCount:
                                                      widget.nextAyaCount!,
                                                  place: widget.place,
                                                  nextAyaPlace:
                                                      widget.nextPlace!,
                                                );
                                                bookmarks[index] = 1;
                                              } else {
                                                BookMarkDB()
                                                    .deleteDataFromDatabase(
                                                        selected: index,
                                                        swraId: widget.swraId,
                                                        swarName:
                                                            widget.swraName,
                                                        nextSwraName:
                                                            widget.nextSwraName!,
                                                        ayaCount:
                                                            widget.ayaCount,
                                                        nextAyaCount:
                                                            widget.nextAyaCount!,
                                                        place: widget.place,
                                                        nextAyaPlace:
                                                            widget.nextPlace!);
                                                bookmarks[index] = 0;
                                              }

                                              Navigator.pop(ctx);
                                            },
                                            child: Text(
                                              bookmarks[index] == 1
                                                  ? 'إزالة علامة مرجع '
                                                  : 'علامة مرجع',
                                            )),
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
                                            onPressed: () {
                                              showCupertinoModalPopup(
                                                  context: ctx,
                                                  builder: (x) {
                                                    return CupertinoActionSheet(
                                                      cancelButton:
                                                          CupertinoActionSheetAction(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    x);
                                                              },
                                                              child: Text(
                                                                  'إلغاء')),
                                                      actions: [
                                                        CupertinoActionSheetAction(
                                                          isDefaultAction: true,
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                TransitionPageRoute(
                                                                    widget:
                                                                        NewTafserScreen(
                                                                  title:
                                                                      "الجلالين",
                                                                  tafser: getTafserGalalyan(
                                                                      "${widget.swraId}",
                                                                      "${index + 1}"),
                                                                  sura: widget
                                                                      .swraName,
                                                                  aya:
                                                                      index + 1,
                                                                )));
                                                          },
                                                          child: Text(
                                                              'تفسير الجلالين'),
                                                        ),
                                                        CupertinoActionSheetAction(
                                                          isDefaultAction: true,
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                TransitionPageRoute(
                                                                    widget:
                                                                        NewTafserScreen(
                                                                  title:
                                                                      "الميسر",
                                                                  tafser: getTafserMoyaser(
                                                                      "${widget.swraId}",
                                                                      "${index + 1}"),
                                                                  sura: widget
                                                                      .swraName,
                                                                  aya:
                                                                      index + 1,
                                                                )));
                                                          },
                                                          child: Text(
                                                              'تفسير الميسر'),
                                                        ),
                                                        CupertinoActionSheetAction(
                                                          isDefaultAction: true,
                                                          onPressed: () async {
                                                            _launchInBrowser(
                                                                'https://aboelazayem-universty.com/ar/tafseer/${widget.swraId}/verse/${index + 1}');
                                                          },
                                                          child: Text(
                                                              'الامام محمد ماضي أبو العزائم ونلاميذه'),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Text('تفسير الأية ')),
                                        CupertinoActionSheetAction(
                                            isDefaultAction: true,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      cancelButton:
                                                          CupertinoActionSheetAction(
                                                        onPressed: () {
                                                          Navigator.pop(ctx);
                                                        },
                                                        child: Text('إلغاء',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red)),
                                                      ),
                                                      actions: [
                                                        CupertinoActionSheetAction(
                                                            onPressed: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (ctx) {
                                                                    return AlertDialog(
                                                                      content:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                7,
                                                                        child:
                                                                            SingleAyaAudio(
                                                                          url: getHusary(
                                                                              index),
                                                                        ),
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
                                                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            ))
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                            child: Text(
                                                                'محمود خليل الحصري (رواية : المصحف المجود)')),
                                                        CupertinoActionSheetAction(
                                                            onPressed: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (ctx) {
                                                                    return AlertDialog(
                                                                      content:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                7,
                                                                        child:
                                                                            SingleAyaAudio(
                                                                          url: getNenea(
                                                                              index),
                                                                        ),
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
                                                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            ))
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                            child: Text(
                                                                'أحمد نعينع (رواية : حفص عن عاصم)')),
                                                        CupertinoActionSheetAction(
                                                            onPressed: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (ctx) {
                                                                    return AlertDialog(
                                                                      content:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height /
                                                                                7,
                                                                        child: SingleAyaAudio(
                                                                            url:
                                                                                getMenshawy(index)),
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
                                                                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            ))
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                            child: Text(
                                                                'محمد صديق المنشاوي (رواية : المصحف المجود)'))
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Text('الإستماع إلى الأية '))
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height / 100),
                              //height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: widget.scrollId == null
                                      ? Colors.white.withOpacity(0.5)
                                      : widget.scrollId! - 1 == index
                                          ? kPrimaryColor.withOpacity(0.5)
                                          : Colors.white.withOpacity(0.6),
                                  border: Border.fromBorderSide(BorderSide(
                                      color: kPrimaryColor.withOpacity(0.3)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height /
                                                100),

                                    //   alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width /
                                        1.27,
                                    child: Text(
                                      '${getVerse(widget.swraId, index + 1)}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Noorehidayat',
                                        color: kSecondryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 7.5,
                                    decoration: bookmarks[index] == 1
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.red.withOpacity(0.1),
                                                    BlendMode.color),
                                                image: AssetImage(
                                                  'assets/images/bookmark12.png',
                                                ),
                                                fit: BoxFit.fill),
                                          )
                                        : BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.white
                                                    .withOpacity(0.1)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: AutoSizeText(
                                      '${getVerseEndSymbol(index + 1)}',
                                      maxFontSize: 17,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kSecondryColor,
                                        fontSize: 17,
                                        fontFamily: 'McsBasmla',
                                        fontWeight: FontWeight.bold,
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

/**========================= Next Swra ============================= */

                    isEnd == true
                        ? widget.juzaCat == false
                            ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      TransitionPageRoute(
                                          widget: AyatFromSwarScreen(
                                        juzaCat: false,
                                        swraId: widget.swraId + 1,
                                        swraName: widget.nextSwraName!,
                                        place: widget.nextPlace!,
                                        ayaCount: widget.nextAyaCount!,
                                        nextSwraName: surah[widget.swraId + 1]
                                            ['name_ar'],
                                        nextPlace: surah[widget.swraId + 1]
                                            ['place_ar'],
                                        nextAyaCount: int.parse(
                                                    surah[widget.swraId + 1]
                                                            ["aya"]
                                                        .toString()) >
                                                10
                                            ? "${surah[widget.swraId + 1]['aya']} أية "
                                            : "${surah[widget.swraId + 1]['aya']} أيات ",
                                      )));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 11,
                                  width: double.infinity,
                                  color: kSecondryColor,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                100),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "سورة ${widget.nextSwraName}  ",
                                          style: TextStyle(
                                              color: Colors.white,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            '${widget.nextPlace}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            '${widget.nextAyaCount}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 2,
                              )
                        : SizedBox(
                            height: 2,
                          )
                  ],
                ),
        ),
      ),
    );
  }
}
