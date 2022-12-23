import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hotel_booking_ui/constants/shared_preferences_keys.dart';
import 'package:get/get.dart';

class Loc extends GetxController {
  late Locale _locale;
  late AppLocalizations _appLocalizations;

  Future<Loc> init() async {
    _locale = await SharedPreferencesKeys().getLanguageType();
    _appLocalizations = await AppLocalizations.delegate.load(_locale);
    return this;
  }

  Future localeLanguage(Locale loca) async {
    log(loca.languageCode);
    await SharedPreferencesKeys().setLanguageType(loca);
    _appLocalizations = await AppLocalizations.delegate.load(loca);
    _locale = loca;
    update();
  }

  bool get isRTL => locale.languageCode == 'ar';
  Locale get locale => _locale;

  AppLocalizations get appLocalizations => _appLocalizations;

  static AppLocalizations get alized => Get.find<Loc>().appLocalizations;
}
