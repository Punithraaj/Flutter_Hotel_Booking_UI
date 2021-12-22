import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/shared_preferences_keys.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/motel_app.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({required ThemeData state}) : super();

  bool _isLightMode = true;
  ThemeData _themeData = AppTheme.getThemeData;
  ThemeModeType _themeModeType = ThemeModeType.system;
  ThemeData get themeData => _themeData;
  bool get isLightMode => _isLightMode;
  ThemeModeType get themeModeType => _themeModeType;
  FontFamilyType get fontType => _fontType;
  FontFamilyType _fontType = FontFamilyType.WorkSans;
  ColorType get colorType => _colorType;
  ColorType _colorType = ColorType.Verdigris;
  LanguageType get languageType => _languageType;
  LanguageType _languageType = LanguageType.en;

  updateThemeMode(ThemeModeType _themeModeType) async {
    await SharedPreferencesKeys().setThemeMode(_themeModeType);
    final systembrightness =
        MediaQuery.of(applicationcontext!).platformBrightness;
    checkAndSetThemeMode(_themeModeType == ThemeModeType.light
        ? Brightness.light
        : _themeModeType == ThemeModeType.dark
            ? Brightness.dark
            : systembrightness);
  }

// this func is auto check theme and update them
  void checkAndSetThemeMode(Brightness systemBrightness) async {
    bool _theLightTheme = _isLightMode;

    // mode is selected by user
    _themeModeType = await SharedPreferencesKeys().getThemeMode();
    if (_themeModeType == ThemeModeType.system) {
      // if mode is system then we add as system birtness
      _theLightTheme = systemBrightness == Brightness.light;
    } else if (_themeModeType == ThemeModeType.dark) {
      _theLightTheme = false;
    } else {
      //light theme selected by user
      _theLightTheme = true;
    }

    if (_isLightMode != _theLightTheme) {
      _isLightMode = _theLightTheme;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  void checkAndSetFonType() async {
    final FontFamilyType fontType = await SharedPreferencesKeys().getFontType();
    if (fontType != _fontType) {
      _fontType = fontType;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  void updateFontType(FontFamilyType _fontType) async {
    await SharedPreferencesKeys().setFontType(_fontType);
    _fontType = _fontType;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  void updateColorType(ColorType _color) async {
    await SharedPreferencesKeys().setColorType(_color);
    _colorType = _color;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  void checkAndSetColorType() async {
    final ColorType _colorTypeData =
        await SharedPreferencesKeys().getColorType();
    if (_colorTypeData != colorType) {
      _colorType = _colorTypeData;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  void updateLanguage(LanguageType _language) async {
    await SharedPreferencesKeys().setLanguageType(_language);
    _languageType = _language;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  void checkAndSetLanguage() async {
    final LanguageType _languageTypeData =
        await SharedPreferencesKeys().getLanguageType();
    if (_languageTypeData != languageType) {
      _languageType = _languageTypeData;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }
}
