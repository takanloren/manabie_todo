import 'dart:collection';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:manabie_todo/common/languages/st_en_us.dart';
import 'package:manabie_todo/common/languages/st_vi_vn.dart';

class LocalizationService extends Translations {

  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

// support language code
  static final langCodes = [
    'en',
    'vi',
  ];

// support Locale
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    if(locale != null){
      Get.updateLocale(locale);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}