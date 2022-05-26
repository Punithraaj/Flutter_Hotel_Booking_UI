import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/popular_filter_list.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/filter_screen/slider_view.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'range_slider_view.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  List<PopularFilterListData> accomodationListData =
      PopularFilterListData.accomodationList;

  RangeValues _values = RangeValues(100, 600);
  double distValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.close,
              onBackClick: () {
                Navigator.pop(context);
              },
              titleText: AppLocalizations(context).of("filtter"),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            //   child: appBar(),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      // hotel price filter
                      priceBarFilter(),
                      Divider(
                        height: 1,
                      ),
                      // facilitate filter in hotel
                      popularFilter(),
                      Divider(
                        height: 1,
                      ),
                      //hotel distance from city
                      distanceViewUI(),
                      Divider(
                        height: 1,
                      ),
                      // all type of  accommodation
                      allAccommodationUI()
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16 + MediaQuery.of(context).padding.bottom,
                  top: 8),
              child: CommonButton(
                  buttonText: AppLocalizations(context).of("Apply_text"),
                  onTap: () {
                    Navigator.pop(context, true);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            AppLocalizations(context).of("type of accommodation"),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getAccomodationListUI(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    List<Widget> noList = [];
    for (var i = 0; i < accomodationListData.length; i++) {
      final date = accomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      AppLocalizations(context).of(date.titleTxt),
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (accomodationListData[0].isSelected) {
        accomodationListData.forEach((d) {
          d.isSelected = false;
        });
      } else {
        accomodationListData.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      accomodationListData[index].isSelected =
          !accomodationListData[index].isSelected;

      var count = 0;
      for (var i = 0; i < accomodationListData.length; i++) {
        if (i != 0) {
          var data = accomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == accomodationListData.length - 1) {
        accomodationListData[0].isSelected = true;
      } else {
        accomodationListData[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            AppLocalizations(context).of("distance from city"),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChnagedistValue: (value) {
            distValue = value;
          },
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            AppLocalizations(context).of("popular filter"),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPList(),
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    List<Widget> noList = [];
    var cout = 0;
    final columCount = 2;
    for (var i = 0; i < popularFilterListData.length / columCount; i++) {
      List<Widget> listUI = [];
      for (var i = 0; i < columCount; i++) {
        try {
          final date = popularFilterListData[cout];
          listUI.add(
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {
                        setState(() {
                          date.isSelected = !date.isSelected;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, bottom: 8, right: 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              date.isSelected
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: date.isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                AppLocalizations(context).of(date.titleTxt),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          cout += 1;
        } catch (e) {}
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations(context).of("price_text"),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          values: _values,
          onChnageRangeValues: (values) {
            _values = values;
          },
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
