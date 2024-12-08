import 'package:shared_preferences/shared_preferences.dart';

class BookMarkPref {
  static SharedPreferences? _bookMarkPreferences;
  static const _bookMark = 'bookmark';

  static Future init() async {
    _bookMarkPreferences = await SharedPreferences.getInstance();
  }

/*------------------------------- bookMark---------------------------- */
  static Future setBookMarkValue(int value) async {
    await _bookMarkPreferences!.setInt(_bookMark, value);
  }

  static int? getBookMarkValue() {
    return _bookMarkPreferences!.getInt(_bookMark);
  }

  static Future clearBookMark() async {
    await _bookMarkPreferences!.clear();
  }

/*---------------------------------------------------------------------- */

}
