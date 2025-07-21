import 'package:exam_app/core/constants/app_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  SharedPreferences sharedPreferences;

  AppConfigProvider({required this.sharedPreferences});

  String selectedLocale = AppConstants.enLocalKey;

  bool isEn() => selectedLocale == AppConstants.enLocalKey;

  Future<void> setSelectedLocale() async {
    var currentLocale = sharedPreferences.getString(AppConstants.localKey) ??
        AppConstants.enLocalKey;
    selectedLocale = currentLocale;
  }

  Future<void> changeLocale(String currentLocale) async {
    if (selectedLocale == currentLocale) return;
    selectedLocale = currentLocale;
    sharedPreferences.setString(AppConstants.localKey, selectedLocale);
    notifyListeners();
  }
}
