import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hotel_booking_ui/constants/localfiles.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/logic/controllers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoadText = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _loadAppLocalizations()); // call after first frame receiver so we have context
    super.initState();
  }

  Future<void> _loadAppLocalizations() async {
    try {
      setState(() {
        isLoadText = true;
      });
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: !Get.find<ThemeController>().isLightMode
                ? BoxDecoration(
                    color: Theme.of(context).backgroundColor.withOpacity(0.4))
                : null,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(Localfiles.introduction, fit: BoxFit.cover),
          ),
          Column(
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context).dividerColor,
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.asset(Localfiles.appIcon),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Motel",
                textAlign: TextAlign.left,
                style: TextStyles(context).getBoldStyle().copyWith(
                      fontSize: 24,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              AnimatedOpacity(
                opacity: isLoadText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 420),
                child: Text(
                  Loc.alized.best_hotel_deals,
                  textAlign: TextAlign.left,
                  style: TextStyles(context).getRegularStyle().copyWith(),
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              AnimatedOpacity(
                opacity: isLoadText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 680),
                child: CommonButton(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, bottom: 8, top: 8),
                  buttonText: Loc.alized.get_started,
                  onTap: () {
                    NavigationServices(context).gotoIntroductionScreen();
                  },
                ),
              ),
              AnimatedOpacity(
                opacity: isLoadText ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1200),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 24.0 + MediaQuery.of(context).padding.bottom,
                      top: 16),
                  child: Text(
                    Loc.alized.already_have_account,
                    textAlign: TextAlign.left,
                    style: TextStyles(context).getDescriptionStyle().copyWith(
                          color: AppTheme.whiteColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
