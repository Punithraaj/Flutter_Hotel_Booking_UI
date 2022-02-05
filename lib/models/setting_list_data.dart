import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static List<SettingsListData> userSettingsList = [
    SettingsListData(
      titleTxt: 'change_password',
      isSelected: false,
      iconData: FontAwesomeIcons.lock,
    ),
    SettingsListData(
      titleTxt: 'invite_friend',
      isSelected: false,
      iconData: FontAwesomeIcons.userFriends,
    ),
    SettingsListData(
      titleTxt: 'credit_coupons',
      isSelected: false,
      iconData: FontAwesomeIcons.gift,
    ),
    SettingsListData(
      titleTxt: 'help_center',
      isSelected: false,
      iconData: FontAwesomeIcons.infoCircle,
    ),
    SettingsListData(
      titleTxt: 'payment_text',
      isSelected: false,
      iconData: FontAwesomeIcons.wallet,
    ),
    SettingsListData(
      titleTxt: 'setting_text',
      isSelected: false,
      iconData: FontAwesomeIcons.cog,
    )
  ];
  static List<SettingsListData> settingsList = [
    SettingsListData(
      titleTxt: 'Notifications',
      isSelected: false,
      iconData: FontAwesomeIcons.solidBell,
    ),
    SettingsListData(
      titleTxt: 'Theme Mode',
      isSelected: false,
      iconData: FontAwesomeIcons.skyatlas,
    ),
    SettingsListData(
      titleTxt: 'Fonts',
      isSelected: false,
      iconData: FontAwesomeIcons.font,
    ),
    SettingsListData(
      titleTxt: 'Color',
      isSelected: false,
      iconData: Icons.color_lens,
    ),
    SettingsListData(
      titleTxt: 'Language',
      isSelected: false,
      iconData: Icons.translate_outlined,
    ),
    SettingsListData(
      titleTxt: 'Country',
      isSelected: false,
      iconData: FontAwesomeIcons.userFriends,
    ),
    SettingsListData(
      titleTxt: 'Currency',
      isSelected: false,
      iconData: FontAwesomeIcons.gift,
    ),
    SettingsListData(
      titleTxt: 'Terms of Services',
      isSelected: false,
      iconData: Icons.keyboard_arrow_right,
    ),
    SettingsListData(
      titleTxt: 'Privacy Policy',
      isSelected: false,
      iconData: Icons.keyboard_arrow_right,
    ),
    SettingsListData(
      titleTxt: 'Give Us Feedbacks',
      isSelected: false,
      iconData: Icons.keyboard_arrow_right,
    ),
    SettingsListData(
      titleTxt: 'Log out',
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
