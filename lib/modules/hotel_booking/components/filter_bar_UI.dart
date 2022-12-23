import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';

class FilterBarUI extends StatelessWidget {
  const FilterBarUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "530",
                    style: TextStyles(context).getRegularStyle(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      Loc.alized.hotel_found,
                      style: TextStyles(context).getRegularStyle(),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      NavigationServices(context).gotoFiltersScreen();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            Loc.alized.filtter,
                            style: TextStyles(context).getRegularStyle(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sort,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Divider(
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
