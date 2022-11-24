// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppLang with ChangeNotifier {
  AppLang({
    required this.appLang,
  });

  String appLang;

  changeappLang(String langCode) {
    List<String> allLangCode = ['en', 'fr'];
    allLangCode.contains(langCode)
        ? appLang = langCode
        : print('no available langauge');
    notifyListeners();
  }
}

class AppStatus with ChangeNotifier {
  bool isLoading;
  bool isActExist;
  bool isLoggedIn;

  AppStatus({
    required this.isLoading,
    required this.isActExist,
    required this.isLoggedIn,
  });

    changeUserStatus(bool changeState) {
    isLoggedIn = changeState;
    notifyListeners();
  }

  changeActExist(bool changeState) {
    isActExist = changeState;
    notifyListeners();
  }
  changeLoading(bool changeState) {
    isLoading= changeState;
    notifyListeners();
  }

}
