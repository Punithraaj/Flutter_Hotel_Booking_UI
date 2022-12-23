import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hotel_booking_ui/constants/localfiles.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/modules/splash/components/page_pop_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeExploreSliderView extends StatefulWidget {
  final double opValue;
  final VoidCallback click;

  const HomeExploreSliderView(
      {Key? key, this.opValue = 0.0, required this.click})
      : super(key: key);
  @override
  State<HomeExploreSliderView> createState() => _HomeExploreSliderViewState();
}

class _HomeExploreSliderViewState extends State<HomeExploreSliderView> {
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.cape_town,
      subText: Loc.alized.five_star,
      assetsImage: Localfiles.explore_2,
    ));
    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.find_best_deals,
      subText: Loc.alized.five_star,
      assetsImage: Localfiles.explore_1,
    ));
    pageViewModelData.add(PageViewData(
      titleText: Loc.alized.find_best_deals,
      subText: Loc.alized.five_star,
      assetsImage: Localfiles.explore_3,
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        if (currentShowIndex == 0) {
          pageController.animateTo(MediaQuery.of(context).size.width,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        } else {
          if (currentShowIndex == 1) {
            pageController.animateTo(MediaQuery.of(context).size.width * 2,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn);
          } else if (currentShowIndex == 2) {
            pageController.animateTo(0,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn);
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: <Widget>[
          PageView(
            controller: pageController,
            pageSnapping: true,
            onPageChanged: (index) {
              currentShowIndex = index;
            },
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              PagePopup(
                imageData: pageViewModelData[0],
                opValue: widget.opValue,
              ),
              PagePopup(
                imageData: pageViewModelData[1],
                opValue: widget.opValue,
              ),
              PagePopup(
                imageData: pageViewModelData[2],
                opValue: widget.opValue,
              ),
            ],
          ),
          Positioned(
            bottom: 32,
            right: Get.find<Loc>().isRTL ? null : 32,
            // left: 32,
            left: Get.find<Loc>().isRTL ? 32 : null,
            //     right: Get.find<ThemeController>().languageType ==
            //             LanguageType.ar
            //         ? 32
            //         : null,
            child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                effect: WormEffect(
                    activeDotColor: Theme.of(context).primaryColor,
                    dotColor: Theme.of(context).dividerColor,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0), // your preferred effect
                onDotClicked: (index) {}),
          ),
        ],
      ),
    );
  }
}

class PagePopup extends StatelessWidget {
  final PageViewData imageData;
  final double opValue;

  const PagePopup({Key? key, required this.imageData, this.opValue = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: (MediaQuery.of(context).size.width * 1.3),
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            imageData.assetsImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 80,
          left: 24,
          right: 24,
          child: Opacity(
            opacity: opValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  imageData.titleText,
                  textAlign: TextAlign.left,
                  style: TextStyles(context)
                      .getTitleStyle()
                      .copyWith(color: AppTheme.whiteColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  imageData.subText,
                  textAlign: TextAlign.left,
                  style: TextStyles(context).getRegularStyle().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
