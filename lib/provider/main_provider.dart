import 'package:com.app.aboelazayem/constants.dart';
// import 'package:com.app.aboelazayem/new_screens/new_quran/text_recognition/model/image_model.dart';
// import 'package:com.app.aboelazayem/new_screens/new_quran/text_recognition/model/text_model.dart';
// import 'package:com.app.aboelazayem/new_screens/new_quran/text_recognition/repositories/exceptions.dart';
// import 'package:com.app.aboelazayem/new_screens/new_quran/text_recognition/repositories/media_service.dart';
// import 'package:com.app.aboelazayem/new_screens/new_quran/text_recognition/repositories/text_recongnize.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class MainProvider with ChangeNotifier {
  List _tafserBookModelList = [];
  Future<bool> checkInternet() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == false) {
      showSimpleNotification(
        Text(
          "no internet Connection ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        background: kPrimaryColor,
      );
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }

  List get getTafserBookModelList {
    return _tafserBookModelList;
  }

  setTafserBookModelList(List tafserBookModelList) {
    _tafserBookModelList = tafserBookModelList;
    notifyListeners();
  }

/************************************************************************** */
  bool _start = true;
  bool _end = false;

  setStartList(bool start) async {
    _start = start;
    notifyListeners();
  }

  bool get start => _start;

  setEndList(bool end) async {
    _end = end;
    notifyListeners();
  }

  bool get end => _end;
  /************************************************************************** */
  String? _searchFieldValue;

  setSearchFieldValue(String searchFieldValue) async {
    _searchFieldValue = searchFieldValue;
    notifyListeners();
  }

  String? get searchFieldValue => _searchFieldValue;

  /*********************************************************************************** */
  // int _bookMark;
  // setBookMark(int bookMark) async {
  //   _bookMark = bookMark;
  //   notifyListeners();
  // }

  // int get bookMarkValue => _bookMark;
}

/*
enum CurrentState { idle, loading, loaded, error }

class BaseModel extends ChangeNotifier {
  CurrentState _state = CurrentState.idle;
  CurrentState get state => _state;

  void setState(CurrentState state) {
    _state = state;
    notifyListeners();
  }
}

class ImageViewModel extends BaseModel {
  ImageModel _image;
  get image => _image;

  void getImage() async {
    //Clears previous picture from memory
    if (_image != null) {
      _image = null;
    }
    setState(CurrentState.loading);
    try {
      final _mediaService = MediaService();
      _image = await _mediaService.pickImageFromGallery();
      setState(CurrentState.loaded);
    } on ImageNotSelectedException {
      setState(CurrentState.error);
    } catch (e) {
      setState(CurrentState.error);
    }
  }
}

List<SingleChildWidget> providers = [
  ///List of all providers
  ChangeNotifierProvider<ImageViewModel>(
    create: (context) => ImageViewModel(),
  ),
  ChangeNotifierProxyProvider<ImageViewModel, TextViewModel>(
    create: (_) => TextViewModel(),
    update: (BuildContext context, ImageViewModel imageProvider,
        TextViewModel textprovider) {
      textprovider.imageProvider = imageProvider;
      return textprovider;
    },
    lazy: true,
  ),
];

class TextViewModel extends BaseModel {
  ImageViewModel _imageProvider;

  List<RecognizedText> _processedTexts;

  List<RecognizedText> get processedTexts => _processedTexts;
  ImageViewModel get imageProvider => _imageProvider;

  set imageProvider(ImageViewModel imageProvider) {
    _imageProvider = imageProvider;
    // emptyList();
  }

  void getText() async {
    setState(CurrentState.loading);
    try {
      final _mlSerive = MlService();
      final ImageModel _image = _imageProvider.image;
      final String _imagePath = _image.imagePath;
      _processedTexts = await _mlSerive.getText(_imagePath);
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.error);
    }
  }

  void emptyList() {
    _processedTexts = [];
  }
}
*/
