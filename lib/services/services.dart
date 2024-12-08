import 'dart:convert';
import 'package:com.app.aboelazayem/model/kasaed_model.dart';
import 'package:com.app.aboelazayem/model/maraqi_model.dart';
import 'package:com.app.aboelazayem/model/poem_model.dart';
import 'package:com.app.aboelazayem/model/quran_voice_model.dart';
import 'package:com.app.aboelazayem/model/sheikh_model.dart';
import 'package:com.app.aboelazayem/model/tafser_model.dart';
import 'package:flutter/cupertino.dart';
import '../model/library_model.dart';
import '../model/tasof.dart';
import 'package:com.app.aboelazayem/model/imam.dart';
import 'package:com.app.aboelazayem/model/university.dart';
import '../model/student_model.dart';
import '../model/quraan_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://aboelazayem-universty.com/api/";

class Services {
  final Uri universityUrl = Uri.parse('${baseUrl}about');
  final Uri imamUrl = Uri.parse('${baseUrl}madi');
  final Uri studentUrl = Uri.parse('${baseUrl}imam');
  final Uri tasofUrl = Uri.parse('${baseUrl}eltasof_details');
  final Uri maraqiUrl = Uri.parse("${baseUrl}categories");
  final Uri sheikhUrl = Uri.parse("${baseUrl}sheikhs");
  final Uri libraryUrl = Uri.parse("${baseUrl}Library");
  final Uri searchGetUrl = Uri.parse("${baseUrl}poems");
  final Uri searchPostUrl = Uri.parse("${baseUrl}search");
  final Uri dropDownUrl = Uri.parse("${baseUrl}rawy");

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

  Future getTafserv2(int suraId, int ayaId) async {
    Uri url = Uri.parse(
        "https://aboelazayem-universty.com/api/tafseer/$suraId/verse/$ayaId");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      /************* Sheikh Json Data *******************/
      var ayaJsonData = jsonDecode(res.body)['ayas'];
      var suraJsonData = jsonDecode(res.body)['swar_names'];
      var algalalynJsonData = jsonDecode(res.body)['Algalalyn'];
      var aLmoyasarJsonData = jsonDecode(res.body)['ALmoyasar'];
      var alsaadyJsonData = jsonDecode(res.body)['Alsaady'];
      var abnKatheerJsonData = jsonDecode(res.body)['AbnKatheer'];
      var albagfwyJsonData = jsonDecode(res.body)['Albagfwy'];
      var altabaryJsonData = jsonDecode(res.body)['Altabary'];
      var alkortabyJsonData = jsonDecode(res.body)['Alkortaby'];
      var imamTafsereData = jsonDecode(res.body)['tafsers'].length == 0
          ? []
          : jsonDecode(res.body)['tafsers'][0]['tafsers'];
      var imamNameData = jsonDecode(res.body)['tafsers'].length == 0
          ? []
          : jsonDecode(res.body)['tafsers'][0]['tafsers'].length == 0
              ? []
              : jsonDecode(res.body)['tafsers'][0]["tafsers"][0]["imams"];

      var ayaText = ayaJsonData.map((e) {
        return Aya.fromJson(e);
      }).toList();

      ///////////
      var studentNameJsonData = jsonDecode(res.body)['StudentName'].length == 0
          ? []
          : jsonDecode(res.body)['StudentName']; // may be null

      var studentNameModeljsonData =
          jsonDecode(res.body)['StudentName'].map((stu) {
        if (stu["student"] != null)
          return StudentNameModel.fromJson(stu["student"]); // may be null
      }).toList();
      var typejsonData = jsonDecode(res.body)['StudentName'].map((stu) {
        // may be null
        if (stu["type"] != null) return TypeModel.fromJson(stu["type"]);
      }).toList();

      ///////////

      /******************  Sheikh fetch Data ********************/
      var suraData = SuraName.fromJson(suraJsonData);
      var algalalyn = Algalalyn.fromJson(algalalynJsonData);
      var aLmoyasar = ALmoyasar.fromJson(aLmoyasarJsonData);
      var alsaady = Alsaady.fromJson(alsaadyJsonData);
      var abnKatheer = AbnKatheer.fromJson(abnKatheerJsonData);
      var albagfwy = Albagfwy.fromJson(albagfwyJsonData);
      var altabary = Altabary.fromJson(altabaryJsonData);
      var alkortaby = Alkortaby.fromJson(alkortabyJsonData);
      var imamName = imamNameData.length == 0
          ? ImamName(name_ar: "empty", name_en: "empty")
          : ImamName.fromJson(imamNameData);
      var imamTafser = imamTafsereData.map((e) {
        return TafserImam.fromJson(e);
      }).toList();

      var studentName =
          studentNameJsonData.map((e) => StudentName.fromJson(e)).toList();

////////////////////////////////

///////////////////////////////

      /************************************************************ */

      return [
        suraData, //0
        algalalyn, //1
        aLmoyasar, //2
        alsaady, //3
        abnKatheer, //4
        albagfwy, //5
        altabary, //6
        alkortaby, //7
        imamName, //8
        imamTafser, //9
        ayaText, //10
        studentName, //11
        studentNameModeljsonData, //12
        typejsonData //13
      ];
    }
  }

  Future getTafserData(int suraId, int ayaId) async {
    Uri url = Uri.parse(
        "https://aboelazayem-universty.com/api/tafseer/$suraId/verse/$ayaId");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var suraNameJsonData = jsonDecode(res.body)['swar_names'];
      var ayaJsonData = jsonDecode(res.body)['ayas'];
      var tafserJsonData = jsonDecode(res.body)['tafsers'].length == 0
          ? []
          : jsonDecode(res.body)['tafsers'][0]['tafsers']; // may be null
      var imamNameJsonData = jsonDecode(res.body)['tafsers'].length == 0
          ? []
          : jsonDecode(res.body)['tafsers']; // may be null
      var studentNameJsonData = jsonDecode(res.body)['StudentName'].length == 0
          ? []
          : jsonDecode(res.body)['StudentName']; // may be null

      var studentNameModeljsonData =
          jsonDecode(res.body)['StudentName'].map((stu) {
        if (stu["student"] != null)
          return StudentNameModel.fromJson(stu["student"]); // may be null
      }).toList();
      var typejsonData = jsonDecode(res.body)['StudentName'].map((stu) {
        // may be null
        if (stu["type"] != null) return TypeModel.fromJson(stu["type"]);
      }).toList();

      /************* Sheikh Json Data *******************/
      var algalalynJsonData = jsonDecode(res.body)['Algalalyn'];

      var aLmoyasarJsonData = jsonDecode(res.body)['ALmoyasar'];

      var alsaadyJsonData = jsonDecode(res.body)['Alsaady'];
      var abnKatheerJsonData = jsonDecode(res.body)['AbnKatheer'];
      var albagfwyJsonData = jsonDecode(res.body)['Albagfwy'];
      var altabaryJsonData = jsonDecode(res.body)['Altabary'];
      var alkortabyJsonData = jsonDecode(res.body)['Alkortaby'];
      print(jsonDecode(res.body)['Algalalyn']);
      /******************  Sheikh fetch Data ********************/

      var algalalyn = Algalalyn.fromJson(algalalynJsonData);
      var aLmoyasar = ALmoyasar.fromJson(aLmoyasarJsonData);
      var alsaady = Alsaady.fromJson(alsaadyJsonData);
      var abnKatheer = AbnKatheer.fromJson(abnKatheerJsonData);
      var albagfwy = Albagfwy.fromJson(albagfwyJsonData);
      var altabary = Altabary.fromJson(altabaryJsonData);
      var alkortaby = Alkortaby.fromJson(alkortabyJsonData);

      /***********************************************/
      var suraName = SuraName.fromJson(suraNameJsonData);
      var ayaData = ayaJsonData.map((e) => Aya.fromJson(e)).toList();
      var tafser = tafserJsonData.map((e) => TafserImam.fromJson(e)).toList();
      var imamName = imamNameJsonData.map((e) => ImamName.fromJson(e)).toList();
      var studentName =
          studentNameJsonData.map((e) => StudentName.fromJson(e)).toList();

      return [
        suraName, //0
        ayaData, //1
        algalalyn, //2
        aLmoyasar, //3
        alsaady, //4
        abnKatheer, //5
        albagfwy, //6
        altabary, //7
        alkortaby, //8
        tafser, //9
        imamName, //10
        studentName, // 11
        studentNameModeljsonData, // 12
        typejsonData //13
      ];
    }
  }

  Future getSwraData(int id) async {
    Uri url = Uri.parse("https://aboelazayem-universty.com/api/quran/$id");

    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body)["swra_name"];

      var ayat = SwraName.fromJson(jsonData);
      var jsonAyaData = jsonDecode(res.body)["swra"];

      var aya = jsonAyaData.map((e) => AyatModel.fromJson(e)).toList();

      return [ayat, aya];
    }
  }

  Future getUniversityData() async {
    http.Response res = await http.get(universityUrl);

    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);

      var unversities =
          jsonData.map((uni) => UniversityModal.fromJson(uni)).toList();

      return unversities;
    }
  }

  Future getImamData() async {
    http.Response res = await http.get(imamUrl);
    if (res.statusCode == 200) {
      var jsonDataImam = jsonDecode(res.body)['imam'];
      var madiTwoData = jsonDecode(res.body)['madi_twos'];
      var imamList = ImamModal.fromJson(jsonDataImam);
      var madiTwo = madiTwoData.map((madi) => MadiTwos.fromJson(madi)).toList();
      return [imamList, madiTwo];
    }
  }

  Future getStudentData() async {
    http.Response res = await http.get(studentUrl);

    if (res.statusCode == 200) {
      var jsonDataStudent = jsonDecode(res.body)['Pupil-1'];
      var jsonDataDataPupilTwo = jsonDecode(res.body)['Pupil-2'];
      var student = StudentModel.fromJson(jsonDataStudent);
      var pupilTwo = jsonDataDataPupilTwo
          .map((pupil) => MadiTwos.fromJson(pupil))
          .toList();
      return [student, pupilTwo];
    }
  }

  Future getTasofData() async {
    http.Response res = await http.get(tasofUrl);

    if (res.statusCode == 200) {
      var jsonDataTasofOne = jsonDecode(res.body)['eltasof-1'];
      var jsonDataTasofTwo = jsonDecode(res.body)['eltasof-2'];
      var tasofOne = TasofModel.fromJson(jsonDataTasofOne);
      var tasofTwo =
          jsonDataTasofTwo.map((tasof) => TasofTwo.fromJson(tasof)).toList();
      return [tasofOne, tasofTwo];
    } else {
      throw Exception('Can not load');
    }
  }

  Future getMaraqiData() async {
    http.Response res = await http.get(maraqiUrl);

    if (res.statusCode == 200) {
      var jsonDataMaraqi = jsonDecode(res.body);

      var maraqi = jsonDataMaraqi.map((e) {
        return MaraqiModel.fromJson(e);
      }).toList();

      return maraqi;
    }
  }

  Future getSheikhData() async {
    http.Response res = await http.get(sheikhUrl);
    if (res.statusCode == 200) {
      var jsonDataSheikh = jsonDecode(res.body);
      var jsonSheikhData = jsonDataSheikh.map((element) {
        return SheikhModel.fromJson(element);
      }).toList();
      return jsonSheikhData;
    }
  }

  Future getSheikhOne() async {
    http.Response res = await http.get(sheikhUrl);
    if (res.statusCode == 200) {
      var jsonDataSheikhOne = jsonDecode(res.body);

      // var jsonSheikhOneData = jsonDataSheikhOne.map((element) {
      //   return SheikhOneModel.fromJson(element);
      // }).toList();
      var jsonSheikhOneData = SheikhOneModel.fromJson(jsonDataSheikhOne);
      return jsonSheikhOneData;
    }
  }

  Future getLibraryData() async {
    http.Response res = await http.get(libraryUrl);
    if (res.statusCode == 200) {
      var jsonDataLibrary = jsonDecode(res.body);
      var libraryData = jsonDataLibrary.map((element) {
        return Library.fromJson(element);
      }).toList();

      return libraryData;
    }
  }

  Future getSearch() async {
    http.Response res = await http.get(searchGetUrl);
    if (res.statusCode == 200) {
      var jsonDataSearch = jsonDecode(res.body);
      List searchData = jsonDataSearch.map((e) {
        return Kasaed.fromJson(e);
      }).toList();
      return searchData;
    }
  }

  Future getDropDown() async {
    http.Response res = await http.get(dropDownUrl);
    if (res.statusCode == 200) {
      var jsonDataSearch = jsonDecode(res.body);
      var list = jsonDataSearch.map((rawy) {
        return Rawy.fromJson(rawy);
      }).toList();
      return list;
    }
  }

  Future getPoemData(int id) async {
    http.Response res = await http
        .get(Uri.parse('https://aboelazayem-universty.com/api/show/$id'));
    print('https://aboelazayem-universty.com/api/show/$id');
    if (res.statusCode == 200) {
      var poemDataJsonData = jsonDecode(res.body);
      var poemDetail = poemDataJsonData.map((e) {
        return Poem.fromJson(e);
      }).toList();

////////////////////////////////////////////////////////////
      var poemrawiesJsonData = jsonDecode(res.body);

      var poemVerse = poemrawiesJsonData.map((e) {
        return e["poem_rawies"]
            .map((vers) => PoemVerse.fromJson(vers))
            .toList();
      }).toList();

//////////////////////////////////////////////////////
      var explainJsonData = jsonDecode(res.body);

      var explain = explainJsonData.map((e) {
        return e["explained"].map((exp) {
          return Explained.fromJson(exp);
        }).toList();
      }).toList();
////////////////////////////////////////////////////////////
      var listenPoemJsonData = jsonDecode(res.body);
      var listenPoem = listenPoemJsonData.map((e) {
        return e['listen'].map((listen) {
          return Listen.fromJson(listen);
        }).toList();
      }).toList();
      return [poemDetail, poemVerse[0], explain[0], listenPoem[0]];
    }
  }

  Future postSearch({
    @required String? search,
  }) async {
    var url = "${baseUrl}search";
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode({
          "search": search != null ? search : '',
        }),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (jsonDecode(res.body) != false) {
          var kasaedData = jsonDecode(res.body);
          print('kaseda data ${kasaedData}');
          return kasaedData;
        }
        return null;
      }
    } catch (e) {
      throw "exception is : $e";
    }
  }
}
