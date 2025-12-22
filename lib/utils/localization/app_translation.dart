import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'indonesia.dart';
import 'english.dart';

class AppTranslation extends Translations {
  static const Locale locale = Locale('id', 'ID');
  static const Locale fallbackLocale = Locale('en', 'US');
  static final locales = [const Locale('id', 'ID'), const Locale('en', 'US')];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': english,
    'id_ID': indonesia,
  };

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < lang.length; i++) {
      if (lang == lang[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}
