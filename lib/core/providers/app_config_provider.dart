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

  // remember me logic

  Future<void> saveRememberMe({
    required String email,
    required String password,
  }) async {
    await sharedPreferences.setBool(AppConstants.rememberMeKey, true);
    await sharedPreferences.setString(AppConstants.savedEmailKey, email);
    await sharedPreferences.setString(AppConstants.savedPasswordKey, password);
  }


  Future<void> clearRememberMe() async {
    await sharedPreferences.remove(AppConstants.rememberMeKey);
    await sharedPreferences.remove(AppConstants.savedEmailKey);
    await sharedPreferences.remove(AppConstants.savedPasswordKey);
  }


  bool get isRemembered =>
      sharedPreferences.getBool(AppConstants.rememberMeKey) ?? false;

  String? get savedEmail =>
      sharedPreferences.getString(AppConstants.savedEmailKey);

  String? get savedPassword =>
      sharedPreferences.getString(AppConstants.savedPasswordKey);

}
