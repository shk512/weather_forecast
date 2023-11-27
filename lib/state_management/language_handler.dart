import 'package:flutter/cupertino.dart';

class LanguageHandler extends ChangeNotifier {
  String languageCode = "en";

  void setLanguageCode(String code) {
    languageCode = code;
    notifyListeners();
  }
}
