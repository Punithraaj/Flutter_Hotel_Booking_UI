import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/filter_screen/filters_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/hotel_home_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/hotel_detailes.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/reviews_list_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/room_booking_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/search_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/login/change_password.dart';
import 'package:flutter_hotel_booking_ui/modules/login/forgot_password.dart';
import 'package:flutter_hotel_booking_ui/modules/login/login_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/login/sign_up_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/country_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/currency_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/edit_profile.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/hepl_center_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/how_do_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/invite_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/settings_screen.dart';
import 'package:flutter_hotel_booking_ui/routes/routes.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  Future gotoSplashScreen() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.splash, (Route<dynamic> route) => false);
  }

  void gotoIntroductionScreen() {
    Navigator.pushNamedAndRemoveUntil(context, RoutesName.introductionScreen,
        (Route<dynamic> route) => false);
  }

  Future<dynamic> gotoLoginScreen() async {
    return await _pushMaterialPageRoute(const LoginScreen());
  }

  Future<dynamic> gotoTabScreen() async {
    return await _pushMaterialPageRoute(const BottomTabScreen());
  }

  Future<dynamic> gotoSignScreen() async {
    return await _pushMaterialPageRoute(const SignUpScreen());
  }

  Future<dynamic> gotoForgotPassword() async {
    return await _pushMaterialPageRoute(const ForgotPasswordScreen());
  }

  Future<dynamic> gotoHotelDetailes(HotelListData hotelData) async {
    return await _pushMaterialPageRoute(HotelDetailes(
      hotelData: hotelData,
    ));
  }

  Future<dynamic> gotoSearchScreen() async {
    return await _pushMaterialPageRoute(const SearchScreen());
  }

  Future<dynamic> gotoHotelHomeScreen() async {
    return await _pushMaterialPageRoute(const HotelHomeScreen());
  }

  Future<dynamic> gotoFiltersScreen() async {
    return await _pushMaterialPageRoute(const FiltersScreen());
  }

  Future<dynamic> gotoRoomBookingScreen(String hotelname) async {
    return await _pushMaterialPageRoute(
        RoomBookingScreen(hotelName: hotelname));
  }

  Future<dynamic> gotoReviewsListScreen() async {
    return await _pushMaterialPageRoute(const ReviewsListScreen());
  }

  Future<dynamic> gotoEditProfile() async {
    return await _pushMaterialPageRoute(const EditProfile());
  }

  Future<dynamic> gotoSettingsScreen() async {
    return await _pushMaterialPageRoute(const SettingsScreen());
  }

  Future<dynamic> gotoHeplCenterScreen() async {
    return await _pushMaterialPageRoute(const HeplCenterScreen());
  }

  Future<dynamic> gotoChangepasswordScreen() async {
    return await _pushMaterialPageRoute(const ChangepasswordScreen());
  }

  Future<dynamic> gotoInviteFriend() async {
    return await _pushMaterialPageRoute(const InviteFriend());
  }

  Future<dynamic> gotoCurrencyScreen() async {
    return await _pushMaterialPageRoute(const CurrencyScreen(),
        fullscreenDialog: true);
  }

  Future<dynamic> gotoCountryScreen() async {
    return await _pushMaterialPageRoute(const CountryScreen(),
        fullscreenDialog: true);
  }

  Future<dynamic> gotoHowDoScreen() async {
    return await _pushMaterialPageRoute(const HowDoScreen());
  }

//   void gotoHotelDetailesPage(String hotelname) async {
//     await _pushMaterialPageRoute(HotelDetailes(hotelName: hotelname));
//   }
}
