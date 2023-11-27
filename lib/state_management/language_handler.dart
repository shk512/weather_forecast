import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/services/spf.dart';

class LanguageHandler extends ChangeNotifier {
  String languageCode = "en";

  void setLanguageCode(String code) {
    languageCode = code;
    SpfService().saveLanguageCode(code);
    notifyListeners();
  }
}
