import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/search_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_search_bar.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import '../../models/hotel_list_data.dart';
import 'search_type_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  List<HotelListData> lastsSearchesList = HotelListData.lastsSearchesList;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.close,
              onBackClick: () {
                Navigator.pop(context);
              },
              titleText: Loc.alized.search_hotel,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 16, bottom: 16),
                          child: CommonCard(
                            color: AppTheme.backgroundColor,
                            radius: 36,
                            child: CommonSearchBar(
                              iconData: FontAwesomeIcons.magnifyingGlass,
                              enabled: true,
                              text: Loc.alized.where_are_you_going,
                            ),
                          ),
                        ),
                        const SearchTypeListView(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  Loc.alized.last_search,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          Loc.alized.clear_all,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ] +
                      getPList() +
                      [
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 16,
                        )
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getPList() {
    List<Widget> noList = [];
    var cout = 0;
    const columCount = 2;
    for (var i = 0; i < lastsSearchesList.length / columCount; i++) {
      List<Widget> listUI = [];
      for (var i = 0; i < columCount; i++) {
        try {
          final date = lastsSearchesList[cout];
          var animation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval((1 / lastsSearchesList.length) * cout, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          );
          animationController.forward();
          listUI.add(Expanded(
            child: SerchView(
              hotelInfo: date,
              animation: animation,
              animationController: animationController,
            ),
          ));
          cout += 1;
        } catch (_) {}
      }
      noList.add(
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: listUI,
          ),
        ),
      );
    }
    return noList;
  }
}
