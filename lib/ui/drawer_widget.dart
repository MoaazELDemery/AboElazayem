import 'package:com.app.aboelazayem/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../new_screens/converstions/converstion_library_screen.dart';
import '../constants.dart';
import '../new_screens/new_about_imam/new_about_imam_screen.dart';
import '../new_screens/new_about_university/new_about_university_screen.dart';
import '../new_screens/new_nasry/new_nasry_category.dart';
import '../new_screens/new_nazmy/new_nazmy_cats.dart';
import '../new_screens/new_tafser_koran/new_tafser_koran_category.dart';
import '../ui/transition_page_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void launchFacebook() async {
    String facebookUrl = "https://aboelazayem-universty.com/ar";
    await canLaunch(facebookUrl)
        ? launch(facebookUrl)
        : print("can't open facebook");
  }

  void launchInstagram() async {
    String instagramUrl = "https://aboelazayem-universty.com/ar";
    await canLaunch(instagramUrl)
        ? launch(instagramUrl)
        : print("can't open Instagram");
  }

  void launchTwitter() async {
    String twitterUrl = "https://aboelazayem-universty.com/ar";
    await canLaunch(twitterUrl)
        ? launch(twitterUrl)
        : print("can't open Twitter");
  }

  void launchYoutube() async {
    String youtubeUrl = "https://aboelazayem-universty.com/ar";
    await canLaunch(youtubeUrl)
        ? launch(youtubeUrl)
        : print("can't open Youtube");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height / 1,
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.6,
              height: MediaQuery.of(context).size.height / 5,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 90,
                  horizontal: MediaQuery.of(context).size.width / 25),
              margin: const EdgeInsets.only(
                top: 30.0,
                bottom: 10.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: kSecondryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: kPrimaryColor)),
              child: Image.asset(
                'assets/images/imam2.png',
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(context,
                        TransitionPageRoute(widget: NewAboutImamScreen()));
                  }
                });
              },
              leading: Image.asset(
                'assets/images/41_07.png',
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText(
                'عن الإمام محمد مضي أبو العزائم ',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(
                        context,
                        TransitionPageRoute(
                            widget: NewAboutUniversityScreen()));
                  }
                });
              },
              leading: Image.asset(
                'assets/images/2.png',
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText('عن جامعة الإمام محمد ماضي أبو العزائم',
                  maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(context,
                        TransitionPageRoute(widget: NewTafserKoranCategory()));
                  }
                });
              },
              leading: Image.asset(
                'assets/images/1.png',
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText(
                  'تفسير القرأن الكريم للإمام محمد ماضي أبو العزائم ',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(context,
                        TransitionPageRoute(widget: NewNasryCategory()));
                  }
                });
              },
              leading: Image.asset(
                'assets/images/41_09.png',
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText('التراث النثري للإمام محمد ماضي أبو العزائم ',
                  maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(context,
                        TransitionPageRoute(widget: NewNazmyCatsScreen()));
                  }
                });
              },
              leading: Image.asset(
                'assets/images/41_05.png',
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText('التراث النظمي للإمام محمد ماضي أبو العزائم ',
                  maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .checkInternet()
                    .then((value) {
                  if (value == true) {
                    Navigator.push(
                        context,
                        TransitionPageRoute(
                            widget: ConverstionLibraryScreen()));
                  }
                });
              },
              leading: Image.asset(
                'assets/icons/16.png',
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 14,
              ),
              title: AutoSizeText('الاحاديث النبوية ',
                  maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            /*
                ExpansionTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    translator.translate("lang"),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'ar',
                          remember: true,
                          restart: true,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("العربية ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          translator.currentLanguage == 'ar'
                              ? Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:
                                      MediaQuery.of(context).size.height / 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 2, color: kPrimaryColor),
                                  ),
                                  child: Icon(
                                    Icons.check_sharp,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:
                                      MediaQuery.of(context).size.height / 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 2, color: Colors.transparent),
                                  ),
                                  child: Icon(
                                    Icons.check_sharp,
                                    color: Colors.transparent,
                                    size: 12,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    InkWell(
                      onTap: () {
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'en',
                          remember: true,
                          restart: true,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("english ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          translator.currentLanguage == 'en'
                              ? Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:
                                      MediaQuery.of(context).size.height / 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 2, color: kPrimaryColor),
                                  ),
                                  child: Icon(
                                    Icons.check_sharp,
                                    color: kPrimaryColor,
                                    size: 12,
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:
                                      MediaQuery.of(context).size.height / 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 2, color: Colors.transparent),
                                  ),
                                  child: Icon(
                                    Icons.check_sharp,
                                    color: Colors.transparent,
                                    size: 12,
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
            */
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Image.asset(
                      'assets/images/55_36.png',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      launchFacebook();
                    }),
                IconButton(
                    icon: Image.asset(
                      'assets/images/55_32.png',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      launchInstagram();
                    }),
                IconButton(
                    icon: Image.asset(
                      'assets/images/55_21.png',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      launchTwitter();
                    }),
                IconButton(
                    icon: Image.asset(
                      'assets/images/55_42.png',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      launchYoutube();
                    }),
              ],
            ),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 10,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: AutoSizeText(
                  ' جامعة الامام محمد ماضي أبو العزائم .حقوق الطبع والنشر محفوظة © 2021 innovations ',
                  maxLines: 1,
                  minFontSize: 7,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
