import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';

class SettingsListData {
  String titleTxt;
  String subTxt;
  IconData iconData;
  bool isSelected;

  SettingsListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.subTxt = '',
    this.iconData = Icons.supervised_user_circle,
  });

  List<SettingsListData> getCountryListFromJson(Map<String, dynamic> json) {
    List<SettingsListData> countryList = [];
    if (json['countryList'] != null) {
      json['countryList'].forEach((v) {
        SettingsListData data = SettingsListData();
        data.titleTxt = v["name"];
        data.subTxt = v["code"];
        countryList.add(data);
      });
    }
    return countryList;
  }

  static List<SettingsListData> get userSettingsList => [
        SettingsListData(
          titleTxt: Loc.alized.change_password,
          isSelected: false,
          iconData: FontAwesomeIcons.lock,
        ),
        SettingsListData(
          titleTxt: Loc.alized.invite_friend,
          isSelected: false,
          iconData: FontAwesomeIcons.userGroup,
        ),
        SettingsListData(
          titleTxt: Loc.alized.credit_coupons,
          isSelected: false,
          iconData: FontAwesomeIcons.gift,
        ),
        SettingsListData(
          titleTxt: Loc.alized.help_center,
          isSelected: false,
          iconData: FontAwesomeIcons.circleInfo,
        ),
        SettingsListData(
          titleTxt: Loc.alized.payment_text,
          isSelected: false,
          iconData: FontAwesomeIcons.wallet,
        ),
        SettingsListData(
          titleTxt: Loc.alized.setting_text,
          isSelected: false,
          iconData: FontAwesomeIcons.gear,
        )
      ];
  static List<SettingsListData> get settingsList => [
        SettingsListData(
          titleTxt: Loc.alized.notifications,
          isSelected: false,
          iconData: FontAwesomeIcons.solidBell,
        ),
        SettingsListData(
          titleTxt: Loc.alized.theme_mode,
          isSelected: false,
          iconData: FontAwesomeIcons.skyatlas,
        ),
        SettingsListData(
          titleTxt: Loc.alized.fonts,
          isSelected: false,
          iconData: FontAwesomeIcons.font,
        ),
        SettingsListData(
          titleTxt: Loc.alized.color,
          isSelected: false,
          iconData: Icons.color_lens,
        ),
        SettingsListData(
          titleTxt: Loc.alized.language,
          isSelected: false,
          iconData: Icons.translate_outlined,
        ),
        SettingsListData(
          titleTxt: Loc.alized.country,
          isSelected: false,
          iconData: FontAwesomeIcons.userGroup,
        ),
        SettingsListData(
          titleTxt: Loc.alized.currency,
          isSelected: false,
          iconData: FontAwesomeIcons.gift,
        ),
        SettingsListData(
          titleTxt: Loc.alized.terms_of_services,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.privacy_policy,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.give_us_feedbacks,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        ),
        SettingsListData(
          titleTxt: Loc.alized.log_out,
          isSelected: false,
          iconData: Icons.keyboard_arrow_right,
        )
      ];

  static List<SettingsListData> currencyList = [
    SettingsListData(
      titleTxt: 'Australia Dollar',
      subTxt: "\$ AUD",
    ),
    SettingsListData(
      titleTxt: 'Argentina Peso',
      subTxt: "\$ ARS",
    ),
    SettingsListData(
      titleTxt: 'Indian rupee',
      subTxt: "₹ Rupee",
    ),
    SettingsListData(
      titleTxt: 'United States Dollar',
      subTxt: "\$ USD",
    ),
    SettingsListData(
      titleTxt: 'Chinese Yuan',
      subTxt: "¥ Yuan",
    ),
    SettingsListData(
      titleTxt: 'Belgian Euro',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'Brazilian Real',
      subTxt: "R\$ Real",
    ),
    SettingsListData(
      titleTxt: 'Canadian Dollar',
      subTxt: "\$ CAD",
    ),
    SettingsListData(
      titleTxt: 'Cuban Peso',
      subTxt: "₱ PESO",
    ),
    SettingsListData(
      titleTxt: 'French Euro',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'Hong Kong Dollar',
      subTxt: "\$ HKD",
    ),
    SettingsListData(
      titleTxt: 'Italian Lira',
      subTxt: "€ Euro",
    ),
    SettingsListData(
      titleTxt: 'New Zealand Dollar',
      subTxt: "\$ NZ",
    ),
  ];

  static List<SettingsListData> helpSearchList = [
    SettingsListData(
      titleTxt: "paying_for_a_reservation",
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I ",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "What methods ",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "When am I charged",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I edit",
    ),
    SettingsListData(
      titleTxt: 'trust_and_safety',
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "I'm_a_guest_What",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "When am I charged",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I edit",
    ),
    SettingsListData(
      titleTxt: "paying_for_a_reservation",
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I ",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "What methods ",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "When am I charged",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I edit",
    ),
    SettingsListData(
      titleTxt: 'trust_and_safety',
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "I'm_a_guest_What",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "When am I charged",
    ),
    SettingsListData(
      titleTxt: '',
      subTxt: "How do I edit",
    ),
  ];

  static List<SettingsListData> subHelpList = [
    SettingsListData(titleTxt: "", subTxt: "You can cancel"),
    SettingsListData(
      titleTxt: "",
      subTxt: "GO to Trips and choose yotr trip",
    ),
    SettingsListData(titleTxt: "", subTxt: "You'll be taken to"),
    SettingsListData(titleTxt: "", subTxt: "If you cancel, your "),
    SettingsListData(
      titleTxt: "",
      subTxt: "Give feedback",
      isSelected: true,
    ),
    SettingsListData(
      titleTxt: "Related articles",
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: "",
      subTxt: "Can I change",
    ),
    SettingsListData(
      titleTxt: "",
      subTxt: "HoW do I cancel",
    ),
    SettingsListData(
      titleTxt: "",
      subTxt: "What is the",
    ),
  ];

  static List<SettingsListData> userInfoList = [
    SettingsListData(
      titleTxt: '',
      subTxt: "",
    ),
    SettingsListData(
      titleTxt: 'username_text',
      subTxt: "Amanda Jane",
    ),
    SettingsListData(
      titleTxt: 'mail_text',
      subTxt: "amanda@gmail.com",
    ),
    SettingsListData(
      titleTxt: 'phone',
      subTxt: "+65 1122334455",
    ),
    SettingsListData(
      titleTxt: 'date_of_birth',
      subTxt: "20, Aug, 1990",
    ),
    SettingsListData(
      titleTxt: 'address_text',
      subTxt: "123 Royal Street, New York",
    ),
  ];
}
