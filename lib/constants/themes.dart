import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hotel_booking_ui/logic/controllers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/models/enum.dart';

class AppTheme {
  static bool get isLightMode {
    try {
      return Get.find<ThemeController>().isLightMode;
    } catch (e) {
      return true;
    }
  }

  // colors
  static Color get primaryColor {
    try {
      ColorType colortypedata = Get.find<ThemeController>().colorType;
      return getColor(colortypedata);
    } catch (e) {
      return getColor(ColorType.verdigris);
    }
  }

  static Color get scaffoldBackgroundColor =>
      isLightMode ? const Color(0xFFF7F7F7) : const Color(0xFF1A1A1A);

  static Color get redErrorColor =>
      isLightMode ? const Color(0xFFAC0000) : const Color(0xFFAC0000);

  static Color get backgroundColor =>
      isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF2C2C2C);

  static Color get primaryTextColor =>
      isLightMode ? const Color(0xFF262626) : const Color(0xFFFFFFFF);

  static Color get secondaryTextColor =>
      isLightMode ? const Color(0xFFADADAD) : const Color(0xFF6D6D6D);

  static Color get whiteColor => const Color(0xFFFFFFFF);
  static Color get backColor => const Color(0xFF262626);

  static Color get fontcolor =>
      isLightMode ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7);

  static ThemeData get getThemeData =>
      isLightMode ? _buildLightTheme() : _buildDarkTheme();

  static TextTheme _buildTextTheme(TextTheme base) {
    FontFamilyType fontType = FontFamilyType.workSans;
    try {
      fontType = Get.find<ThemeController>().fontType;
    } catch (_) {}

    return base.copyWith(
      headline1: getTextStyle(fontType, base.headline1!), //f-size 96
      headline2: getTextStyle(fontType, base.headline2!), //f-size 60
      headline3: getTextStyle(fontType, base.headline3!), //f-size 48
      headline4: getTextStyle(fontType, base.headline4!), //f-size 34
      headline5: getTextStyle(fontType, base.headline5!), //f-size 24
      headline6: getTextStyle(
        fontType,
        base.headline6!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 20
      button: getTextStyle(fontType, base.button!), //f-size 14
      caption: getTextStyle(fontType, base.caption!), //f-size 12
      bodyText1: getTextStyle(fontType, base.bodyText1!), //f-size 16
      bodyText2: getTextStyle(fontType, base.bodyText2!), //f-size 14
      subtitle1: getTextStyle(
        fontType,
        base.subtitle1!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 16
      subtitle2: getTextStyle(fontType, base.subtitle2!), //f-size 14
      overline: getTextStyle(fontType, base.overline!), //f-size 10
    );
  }

// we also get some Light and Dark color variants
  static Color getColor(ColorType colordata) {
    switch (colordata) {
      case ColorType.verdigris:
        return isLightMode ? const Color(0xFF4FBE9F) : const Color(0xFF4FBE9F);
      case ColorType.malibu:
        return isLightMode ? const Color(0xFF5DCAEC) : const Color(0xFF5DCAEC);
      case ColorType.darkSkyBlue:
        return isLightMode ? const Color(0xFF458CEA) : const Color(0xFF458CEA);
      case ColorType.bilobaFlower:
        return isLightMode ? const Color(0xFFff5f5f) : const Color(0xFFff5f5f);
    }
  }

  static TextStyle getTextStyle(
      FontFamilyType fontFamilyType, TextStyle textStyle) {
    switch (fontFamilyType) {
      case FontFamilyType.montserrat:
        return GoogleFonts.montserrat(textStyle: textStyle);
      case FontFamilyType.workSans:
        return GoogleFonts.workSans(textStyle: textStyle);
      case FontFamilyType.varela:
        return GoogleFonts.varela(textStyle: textStyle);
      case FontFamilyType.satisfy:
        return GoogleFonts.satisfy(textStyle: textStyle);
      case FontFamilyType.dancingScript:
        return GoogleFonts.dancingScript(textStyle: textStyle);
      case FontFamilyType.kaushanScript:
        return GoogleFonts.kaushanScript(textStyle: textStyle);
      default:
        return GoogleFonts.roboto(textStyle: textStyle);
    }
  }

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData _buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      color: backgroundColor,
      shadowColor: secondaryTextColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(0),
    );
  }

  static get mapCardDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.getThemeData.dividerColor,
              offset: const Offset(4, 4),
              blurRadius: 8.0),
        ],
      );
  static get buttonDecoration => BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.getThemeData.dividerColor,
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      );
  static get searchBarDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(38)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.getThemeData.dividerColor,
            blurRadius: 8,
            // offset: Offset(4, 4),
          ),
        ],
      );

  static get boxDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.getThemeData.dividerColor,
            //   offset: Offset(2, 2),
            blurRadius: 8,
          ),
        ],
      );
}

enum ThemeModeType {
  system,
  dark,
  light,
}
