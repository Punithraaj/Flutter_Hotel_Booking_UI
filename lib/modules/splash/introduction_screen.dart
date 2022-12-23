import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/localfiles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/modules/splash/components/page_pop_view.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.plan_your_trips,
      subText: Loc.alized.book_one_of_your,
      assetsImage: Localfiles.introduction1,
    ));

    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.find_best_deals,
      subText: Loc.alized.find_deals_for_any,
      assetsImage: Localfiles.introduction2,
    ));

    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.best_travelling_all_time,
      subText: Loc.alized.find_deals_for_any,
      assetsImage: Localfiles.introduction3,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {
                currentShowIndex = index;
              },
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                PagePopup(imageData: pageViewModelData[0]),
                PagePopup(imageData: pageViewModelData[1]),
                PagePopup(imageData: pageViewModelData[2]),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Theme.of(context).dividerColor,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 5.0), // your preferred effect
            onDotClicked: (index) {},
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 8, top: 32),
            buttonText: Loc.alized.login,
            onTap: () {
              NavigationServices(context).gotoLoginScreen();
            },
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 32, top: 8),
            buttonText: Loc.alized.create_account,
            backgroundColor: AppTheme.backgroundColor,
            textColor: AppTheme.primaryTextColor,
            onTap: () {
              NavigationServices(context).gotoSignScreen();
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
