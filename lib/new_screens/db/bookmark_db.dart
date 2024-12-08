import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

Database? database;

class BookMarkDB {
  Future createDatabase() async {
    database = await openDatabase(
      'bookMark.db',
      version: 1,
      onCreate: (database, version) async {
        print("database created");
        await database
            .execute(
                'CREATE TABLE bookMark (id INTEGER PRIMARY KEY , scrollId INTEGER , selected INTEGER,swraId INTEGER,swarName TEXT, nextSwraName TEXT ,ayaCount TEXT, nextAyaCount TEXT,place TEXT , nextAyaPlace TEXT)')
            .then((value) {
          print("table created ");
        }).catchError((error) {
          print("error when create table ${error.toString()}");
        });
      },
      onOpen: (database) async {
        print("database opened");
        print("database object is : $database");
        /* await database.transaction((Transaction txn) {
          return txn
              .rawInsert(
                  'INSERT INTO bookMark (scrollId,selected,swraId,swarName,nextSwraName,ayaCount,nextAyaCount,place,nextAyaPlace) VALUES ($scrollId,$selected,$swraId,"$swarName","$nextSwraName","$ayaCount","$nextAyaCount","$place","$nextAyaCount")')
              .then((value) {
            print("raw inserted in table ");
          }).catchError((error) {
            print("error in insert raw in database ${error.toString()}");
          });
        });*/
        // void getDataFromDatabase() async {
        //   List<Map> bookmarkData =
        //       await database.rawQuery('SELECT * FROM bookMark ');
        //   print("bookmark is $bookmarkData");
        // }
      },
    );
  }

/*/*//*/**//*/*/*/*/********************************/*/*/*/*/*/*/*/
  Future insertToDatabase({
    required int scrollId,
    required int selected,
    required int swraId,
    required String swarName,
    required String nextSwraName,
    required String ayaCount,
    required String nextAyaCount,
    required String place,
    required String nextAyaPlace,
  }) async {
    await database!.transaction((Transaction txn) {
      return txn
          .rawInsert(
              'INSERT INTO bookMark (scrollId,selected,swraId,swarName,nextSwraName,ayaCount,nextAyaCount,place,nextAyaPlace) VALUES ($scrollId,$selected,$swraId,"$swarName","$nextSwraName","$ayaCount","$nextAyaCount","$place","$nextAyaPlace")')
          .then((value) {
        print("raw inserted in table ");
      }).catchError((error) {
        print("error in insert raw in database ${error.toString()}");
      });
    });
  }

/*/*//*/**//*/*/*/*/********************************/*/*/*/*/*/*/*/
  Future<List<Map>> getDataFromDatabase() async {
    return await database!.rawQuery('SELECT * FROM bookmark');
  }

  /*/*//*/**//*/*/*/*/********************************/*/*/*/*/*/*/*/

  Future deleteDataFromDatabase({
    required int selected,
    required int swraId,
    required String swarName,
    required String nextSwraName,
    required String ayaCount,
    required String nextAyaCount,
    required String place,
    required String nextAyaPlace,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawDelete(
              'DELETE FROM bookMark WHERE selected = $selected AND swraId =$swraId AND swarName= "$swarName" AND nextSwraName = "$nextSwraName" AND ayaCount = "$ayaCount" AND nextAyaCount = "$nextAyaCount" AND place = "$place" AND nextAyaPlace = "$nextAyaPlace"')
          .then((value) {
        print("raw deleted from table ");
      }).catchError((error) {
        print("error in delete raw from database ${error.toString()}");
      });
    });
  }

  Future getCount({
    required int selected,
    required int swraId,
  }) async {
    return Sqflite.firstIntValue(await database!.rawQuery(
        'SELECT COUNT(*) FROM bookMark WHERE selected = $selected AND swraId=$swraId'));
  }

  Future getAllCount() async {
    return Sqflite.firstIntValue(
        await database!.rawQuery('SELECT COUNT(*) FROM bookMark '));
  }

  Future deleteAll() async {
    return await database!.rawQuery('DELETE FROM bookMark');
  }
}
