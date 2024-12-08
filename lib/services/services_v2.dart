import 'dart:convert';
import 'package:com.app.aboelazayem/model/model%20_version_2/about_imam_library_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/about_imam_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/about_university_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/audios_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/drawer_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/imam_sons_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/marqi_text_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/nazmy_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/tafser_imam_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/tasof_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/toras_nasry_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/videos_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://aboelazayem-universty.com/api/";

class ServicesV2 {
  /*=========== Drawer Url======================== */
  final Uri drawerData = Uri.parse("${baseUrl}Home");
  /*=========== About Imam Url======================== */
  final Uri aboutImam = Uri.parse("${baseUrl}AboutImam");
  final Uri aboutImamLibrary = Uri.parse("${baseUrl}ImamLibrary");
  /*=========== About University Url======================== */
  final Uri aboutUniversityLibrary = Uri.parse("${baseUrl}UniversityLibrary");
  final Uri conversationsUrl = Uri.parse("${baseUrl}conversations");
  final Uri aboutUniversityUrl = Uri.parse("${baseUrl}AboutUniversity");
  /*============== Tafsir  Imam Url ================================== */
  final Uri tafsirImamUrl = Uri.parse("${baseUrl}Tafsir");
  /*================= Toras Nasry url =============================== */
  final Uri torasNasryUrl = Uri.parse("${baseUrl}Prosehome");
/*================= Toras Nazmy url =============================== */
  final Uri torasNazmyUrl = Uri.parse("${baseUrl}AboutNazmy");
/*================= tasof url =============================== */
  final Uri tasofUrl = Uri.parse("${baseUrl}AboutEltasof");
  /*================= maraqi text  url =============================== */
  final Uri maraqiTextUrl = Uri.parse("${baseUrl}MarakyText");
/*================= Imam sons urls =============================== */
  final Uri imamSonsTextUrl = Uri.parse("${baseUrl}AboutDisciples");
  final Uri imamSonsAboutrl = Uri.parse("${baseUrl}Disciplesimam");

/*================= videos and audios urls =============================== */
  final Uri videoMediaTextUrl = Uri.parse("${baseUrl}homeMAX");

/*================= videos urls =============================== */

/*=================================== AboutImam Functions  =================================================== */
/*===========================================================================================================
============================================================================================================= */
  Future getDrawerData() async {
    var res = await http.get(drawerData);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var drawerData = jsonData.map((e) {
        return DrawerModel.fromJson(e);
      }).toList();
      return drawerData;
    }
  }

  Future getAboutImamText() async {
    var res = await http.get(aboutImam);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var aboutImamTextData = jsonData.map((e) {
        return AboutImamModel.fromJson(e);
      }).toList();
      return aboutImamTextData;
    }
  }

  Future getAboutImamLibrary() async {
    var res = await http.get(aboutImamLibrary);
    if (res.statusCode == 200) {
      var jsonTextData = jsonDecode(res.body)[0]['imamtext'];
      var jsonLibraryData = jsonDecode(res.body)[0]['imam_book'];
      var imamLibraryText = jsonTextData.map((e) {
        return LibraryImamTextModel.fromJson(e);
      }).toList();

      var imamLibraryData = jsonLibraryData.map((e) {
        return LibraryImamBookModel.fromJson(e);
      }).toList();
      return [imamLibraryText, imamLibraryData];
    }
  }

/*========================================================================================================== */
/* ============================ AboutUnviversity Functions  ================================================ */
/*========================================================================================================= */
  Future getAboutUniversityData() async {
    var res = await http.get(aboutUniversityUrl);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var aboutUniversityTextData = jsonData.map((e) {
        return AboutUniversityModel.fromJson(e);
      }).toList();
      return aboutUniversityTextData;
    }
  }

  Future getAboutUniversityLibrary() async {
    var res = await http.get(aboutUniversityLibrary);

    if (res.statusCode == 200) {
      var jsonTextData = jsonDecode(res.body)[0]['university_text'];
      var jsonLibraryData = jsonDecode(res.body)[0]['university_book'];

      var universityLibraryText = jsonTextData.map((e) {
        return LibraryUniversityTextModel.fromJson(e);
      }).toList();

      var universityLibraryData = jsonLibraryData.map((e) {
        return LibraryUniverrsityBookModel.fromJson(e);
      }).toList();

      return [universityLibraryText, universityLibraryData];
    }
  }

  Future getConverstion() async {
    var res = await http.get(conversationsUrl);

    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);

      var converstionText = jsonData.map((e) {
        return ConverstionModel.fromJson(e);
      }).toList();

      return converstionText;
    }
  }

/*========================================================================================================== */
/* ============================ TafsirImam Functions  ================================================ */
/*========================================================================================================= */

  Future getTafsirImamData() async {
    var res = await http.get(tafsirImamUrl);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      var tafsirData = jsonData.map((e) {
        return TafserImamModel.fromJson(e);
      }).toList();

      return tafsirData;
    }
  }

/*========================================================================================================== */
/* ============================ Toras Nasry Functions  ================================================ */
/*========================================================================================================= */

  Future getNasryData() async {
    var res = await http.get(torasNasryUrl);
    if (res.statusCode == 200) {
      var jsonAboutsData = jsonDecode(res.body)['abouts'];
      var jsonLibrariesData = jsonDecode(res.body)['librarys'];
      var nasryAboutData = jsonAboutsData.map((e) {
        return TorasNasryAboutModel.fromJson(e);
      }).toList();
      var nasryLibrariesData = jsonLibrariesData.map((e) {
        return TorasNasryLibrarriesModel.fromJson(e);
      }).toList();

      return [nasryAboutData, nasryLibrariesData];
    }
  }

  Future getNasryLibraryData(int id) async {
    var url = 'https://aboelazayem-universty.com/api/proseLibrary/$id';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonLibraryCategoryData = jsonDecode(res.body)['categories'];
      var jsonLibraryTextData = jsonDecode(res.body)['texts'];
      var libraryCategryData = jsonLibraryCategoryData.map((e) {
        return TroasNasryLibraryCategoryModel.fromJson(e);
      }).toList();
      var libraryTextData = jsonLibraryTextData.map((e) {
        return TroasNasryLibraryTextModel.fromJson(e);
      }).toList();
      return [libraryTextData, libraryCategryData];
    }
  }

  Future getNasryBookData(int id) async {
    String url = 'https://aboelazayem-universty.com/api/ProseBook/$id';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBookData = jsonDecode(res.body);

      var nasryBookData = jsonBookData.map((e) {
        return TrosNasryBookModel.fromJson(e);
      }).toList();

      return nasryBookData;
    }
  }

/*========================================================================================================== */
/* ============================ Toras Nazmy Functions  ================================================ */
/*========================================================================================================= */

  Future getNazmyData() async {
    var res = await http.get(torasNazmyUrl);
    if (res.statusCode == 200) {
      var jsonAboutsData = jsonDecode(res.body)['abouts'];
      var jsonLibrariesData = jsonDecode(res.body)['librarys'];
      var nazmyAboutData = jsonAboutsData.map((e) {
        return AboutNazmyModel.fromJson(e);
      }).toList();
      var nazmyLibrariesData = jsonLibrariesData.map((e) {
        return NazmyLibraryModel.fromJson(e);
      }).toList();

      return [nazmyAboutData, nazmyLibrariesData];
    }
  }

  Future getNazmyLibraryData(int id) async {
    var url = 'https://aboelazayem-universty.com/api/NazmyLibrary/$id';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonLibraryCategoryData = jsonDecode(res.body)['categories'];
      var jsonLibraryTextData = jsonDecode(res.body)['texts'];
      var libraryCategryData = jsonLibraryCategoryData.map((e) {
        return NazmyLibraryCategoryModel.fromJson(e);
      }).toList();
      var libraryTextData = jsonLibraryTextData.map((e) {
        return NazmyLibraryTextModel.fromJson(e);
      }).toList();
      return [libraryTextData, libraryCategryData];
    }
  }

  Future getNazmyBookData(int id) async {
    var url = 'https://aboelazayem-universty.com/api/Nazmybook/$id';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBookData = jsonDecode(res.body)['book'];

      var libraryCategryData = jsonBookData.map((e) {
        return NazmyLibraryBookModel.fromJson(e);
      }).toList();

      return libraryCategryData;
    }
  }

/*========================================================================================================== */
/* ============================ tasof Functions  ================================================ */
/*========================================================================================================= */

  Future getTasofHomeData() async {
    var res = await http.get(tasofUrl);
    if (res.statusCode == 200) {
      var jsonAboutdata = jsonDecode(res.body)['abouts'];
      var jsonLibrarysdata = jsonDecode(res.body)['librarys'];
      var homeAboutData = jsonAboutdata.map((e) {
        return TasofHomeAboutModel.fromJson(e);
      }).toList();
      var homeLibraryData = jsonLibrarysdata.map((e) {
        return TasofHomeLibraryModel.fromJson(e);
      }).toList();

      return [homeAboutData, homeLibraryData];
    }
  }

  Future getTasofLibraryData(int id) async {
    String url = 'https://aboelazayem-universty.com/api/EltasofBook/$id';
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var jsonTextdata = jsonDecode(res.body)['text'];
      var jsonBooksdata = jsonDecode(res.body)['book'];
      var bookTextData = jsonTextdata.map((e) {
        return TasofLibraryTextModel.fromJson(e);
      }).toList();
      var bookLibraryData = jsonBooksdata.map((e) {
        return TasofLibraryBookModel.fromJson(e);
      }).toList();

      return [bookTextData, bookLibraryData];
    }
  }
/*========================================================================================================== */
/* ============================ maraqiText Functions  ================================================ */
/*========================================================================================================= */

  Future getMaraqiTextData() async {
    var res = await http.get(maraqiTextUrl);
    if (res.statusCode == 200) {
      var jsonMaraqiTextdata = jsonDecode(res.body);

      var maraqiTextdata = jsonMaraqiTextdata.map((e) {
        return MaraqiTextModel.fromJson(e);
      }).toList();

      return maraqiTextdata;
    }
  }

  /*========================================================================================================== */
/* ============================ Imam Sons Functions  ================================================ */
/*========================================================================================================= */

  Future getImamSonsText() async {
    var res = await http.get(imamSonsTextUrl);
    if (res.statusCode == 200) {
      var jsonImamSonsText = jsonDecode(res.body);

      var imamAboutText = jsonImamSonsText.map((e) {
        return ImamSonsTextModel.fromJson(e);
      }).toList();

      return imamAboutText;
    }
  }

  Future getImamSonsLibrary() async {
    var res = await http.get(imamSonsAboutrl);
    if (res.statusCode == 200) {
      var jsonImamAbout = jsonDecode(res.body);
      var imamAbout = jsonImamAbout.map((e) {
        return ImamAboutTextModel.fromJson(e);
      }).toList();

      return imamAbout;
    }
  }

  Future getImamtext(int id) async {
    final Uri imamTextUrl = Uri.parse("${baseUrl}Disciplestext/$id");

    try {
      var res = await http.get(imamTextUrl);

      if (res.statusCode == 200) {
        var jsonSheikhText = jsonDecode(res.body);
        var sheikhText = jsonSheikhText.map((e) {
          return SheikhTextModel.fromJson(e);
        }).toList();
        return sheikhText;
      }
    } catch (e) {
      print("error is : ${e}");
      throw e;
    }
  }

  Future getImamBtu(int id) async {
    final Uri imamBtuUrl = Uri.parse("${baseUrl}Disciplesbtu/$id");

    try {
      var res = await http.get(imamBtuUrl);

      if (res.statusCode == 200) {
        var jsonSheikhBtu = jsonDecode(res.body);
        var sheikhBtu = jsonSheikhBtu.map((e) {
          return SheikhBtuModel.fromJson(e);
        }).toList();
        return sheikhBtu;
      }
    } catch (e) {
      throw e;
    }
  }

  Future getImamPdf(int id) async {
    final Uri imamPdfUrl = Uri.parse("${baseUrl}pdfLibrary/$id");

    try {
      var res = await http.get(imamPdfUrl);

      if (res.statusCode == 200) {
        var jsonSheikhPdf = jsonDecode(res.body);
        var sheikhPdf = jsonSheikhPdf.map((e) {
          return ImamPdfModel.fromJson(e);
        }).toList();
        return sheikhPdf;
      }
    } catch (e) {
      print("error is : $e");
      throw e;
    }
  }

  Future getImamVideo(int id) async {
    final Uri imamVideoUrl = Uri.parse("${baseUrl}videoLibrary/$id");

    try {
      var res = await http.get(imamVideoUrl);

      if (res.statusCode == 200) {
        var jsonSheikhVideo = jsonDecode(res.body);
        var sheikhVideo = jsonSheikhVideo.map((e) {
          return ImamVideoModel.fromJson(e);
        }).toList();
        return sheikhVideo;
      }
    } catch (e) {
      print("error is : $e");
      throw e;
    }
  }

  Future getImamAudio(int id) async {
    final Uri imamImamUrl = Uri.parse("${baseUrl}AudioLibrary/$id");

    try {
      var res = await http.get(imamImamUrl);

      if (res.statusCode == 200) {
        var jsonSheikhAudio = jsonDecode(res.body);
        var sheikhAudio = jsonSheikhAudio.map((e) {
          return ImamAudioModel.fromJson(e);
        }).toList();
        return sheikhAudio;
      }
    } catch (e) {
      print("error is : $e");
      throw e;
    }
  }

/*========================================================================================================== */
/* ============================ video  Functions  ================================================ */
/*========================================================================================================= */

  Future getVideoMediaText() async {
    var res = await http.get(videoMediaTextUrl);
    if (res.statusCode == 200) {
      var jsonMediaTextData = jsonDecode(res.body)[0]['media_text'];
      var mediaText = jsonMediaTextData.map((e) {
        return MediaTextModel.fromJson(e);
      }).toList();

      return mediaText;
    }
  }

  Future getVideoButtonLibrary() async {
    var res = await http.get(videoMediaTextUrl);
    if (res.statusCode == 200) {
      var jsonButtonLibrary = jsonDecode(res.body)[0]['button_library'];
      var buttonLibraryt = jsonButtonLibrary.map((e) {
        return ButtonLibraryModel.fromJson(e);
      }).toList();
      return buttonLibraryt;
    }
  }
/*========================================================================================================== */
/* ============================ Audios Functions  ================================================ */
/*========================================================================================================= */

  Future getAudioMediText() async {
    var res = await http.get(videoMediaTextUrl);
    if (res.statusCode == 200) {
      var jsonAudioMediaTextData = jsonDecode(res.body)[1]['media_text'];
      var audioMediaText = jsonAudioMediaTextData.map((e) {
        return AudioMediaTextModel.fromJson(e);
      }).toList();

      return audioMediaText;
    }
  }

  Future getAudioButtonLibrary() async {
    var res = await http.get(videoMediaTextUrl);
    if (res.statusCode == 200) {
      var jsonAudioButtonLibrary = jsonDecode(res.body)[1]['button_library'];
      var audioButtonLibraryt = jsonAudioButtonLibrary.map((e) {
        return AudioButtonLibraryModel.fromJson(e);
      }).toList();
      return audioButtonLibraryt;
    }
  }

/*========================================================================================================== */
/* ============================ Imam Sons Functions  ================================================ */
/*========================================================================================================= */
}





/*
Future getTafserImam(BuildContext context) async {
    try {
      var res = await http
          .get(Uri.parse("https://aboelazayem-universty.com/api/Tafsir"));
      if (res.statusCode == 200) {
        var jsonTextData = jsonDecode(res.body);

        var tafserData = jsonTextData.map((e) {
          return TafserImamModel.fromJson(e);
        }).toList();
        print("tafserData ${tafserData.length}");
        List tafsir_book = [];
        for (int i = 0; i < tafserData.length; i++) {
          tafsir_book.add(tafserData[i].tafsir_book);
        }

        print("tafsir_book ${tafsir_book.length}");
        Provider.of<MainProvider>(context, listen: false)
            .setTafserBookModelList(tafsir_book);
        return tafserData;
      }
    } catch (e) {
      throw e;
    }
  }
 */

/*
  Future getAllQuran() async {
    Uri url = Uri.parse("https://aboelazayem-universty.com/api/swra_name");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);

      var swra = jsonData.map((e) => SwraModel.fromJson(e)).toList();

      return swra;
    }
  }

  Future getQuranVoice(int suraId) async {
    Uri url = Uri.parse(
        "https://www.aboelazayem-universty.com/api/swra_voice/$suraId");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      /******* jsonData  **************/
      var suraNameJsonData = jsonDecode(res.body)['swar_names'];

      var shikhNamesJsonData = jsonDecode(res.body)['shikh_names'];

      var valueJsonData = jsonDecode(res.body)['value'];

      var suraName = SwarNames.fromJson(suraNameJsonData);

      var shikhNames =
          shikhNamesJsonData.map((e) => ShikhNames.fromJson(e)).toList();
      var value = valueJsonData;

      return [suraName, shikhNames, value];
    }
  }



 */