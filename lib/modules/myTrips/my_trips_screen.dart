import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/favorites_list_view.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/finish_trip_view.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/upcoming_list_view.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/bottom_top_move_animation_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:provider/provider.dart';

class MyTripsScreen extends StatefulWidget {
  final AnimationController animationController;

  const MyTripsScreen({Key? key, required this.animationController})
      : super(key: key);
  @override
  _MyTripsScreenState createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen>
    with TickerProviderStateMixin {
  late AnimationController tabAnimationController;

  Widget indexView = Container();
  TopBarType topBarType = TopBarType.Upcomming;

  @override
  void initState() {
    tabAnimationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = UpcomingListView(
      animationController: tabAnimationController,
    );
    tabAnimationController..forward();
    widget.animationController.forward();

    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    tabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomTopMoveAnimationView(
      animationController: widget.animationController,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(child: _getappBar()),
            ),
            //upcoming finished favorites selected
            tabViewUI(topBarType),
            //hotel list view
            Expanded(
              child: indexView,
            ),
          ],
        ),
      ),
    );
  }

  void tabClick(TopBarType tabType) {
    if (tabType != topBarType) {
      topBarType = tabType;
      tabAnimationController.reverse().then((f) {
        if (tabType == TopBarType.Upcomming) {
          setState(() {
            indexView = UpcomingListView(
              animationController: tabAnimationController,
            );
          });
        } else if (tabType == TopBarType.Finished) {
          setState(() {
            indexView = FinishTripView(
              animationController: tabAnimationController,
            );
          });
        } else if (tabType == TopBarType.Favorites) {
          setState(() {
            indexView = FavoritesListView(
              animationController: tabAnimationController,
            );
          });
        }
      });
    }
  }

  Widget tabViewUI(TopBarType tabType) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CommonCard(
        color: AppTheme.backgroundColor,
        radius: 36,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _getTopBarUi(() {
                  tabClick(TopBarType.Upcomming);
                },
                    tabType == TopBarType.Upcomming
                        ? AppTheme.primaryColor
                        : AppTheme.secondaryTextColor,
                    "upcoming"),
                _getTopBarUi(() {
                  tabClick(TopBarType.Finished);
                },
                    tabType == TopBarType.Finished
                        ? AppTheme.primaryColor
                        : AppTheme.secondaryTextColor,
                    "finished"),
                _getTopBarUi(() {
                  tabClick(TopBarType.Favorites);
                },
                    tabType == TopBarType.Favorites
                        ? AppTheme.primaryColor
                        : AppTheme.secondaryTextColor,
                    "favorites"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _getTopBarUi(VoidCallback onTap, Color color, String text) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          highlightColor: Colors.transparent,
          splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            child: Center(
              child: Text(
                AppLocalizations(context).of(text),
                style: TextStyles(context)
                    .getRegularStyle()
                    .copyWith(fontWeight: FontWeight.w600, color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getappBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24 + 4.0, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations(context).of("My_Trips"),
              style: TextStyles(context).getBoldStyle().copyWith(fontSize: 22)),
        ],
      ),
    );
  }
}

enum TopBarType { Upcomming, Finished, Favorites }
