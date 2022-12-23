import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';

class CustomCalendarView extends StatefulWidget {
  final DateTime minimumDate;
  final DateTime maximumDate;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final Function(DateTime, DateTime) startEndDateChange;

  const CustomCalendarView(
      {Key? key,
      required this.initialStartDate,
      required this.initialEndDate,
      required this.startEndDateChange,
      required this.minimumDate,
      required this.maximumDate})
      : super(key: key);

  @override
  State<CustomCalendarView> createState() => _CustomCalendarViewState();
}

class _CustomCalendarViewState extends State<CustomCalendarView> {
  List<DateTime> dateList = [];
  var currentMonthDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  final String languageCode = Get.find<Loc>().locale.languageCode;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    var newDate = DateTime(monthDate.year, monthDate.month, 0);
    int privusMothDay = 0;
    if (newDate.weekday < 7) {
      privusMothDay = newDate.weekday;
      for (var i = 1; i <= privusMothDay; i++) {
        dateList.add(newDate.subtract(Duration(days: privusMothDay - i)));
      }
    }
    for (var i = 0; i < (42 - privusMothDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
    // if (dateList[dateList.length - 7].month != monthDate.month) {
    //   dateList.removeRange(dateList.length - 7, dateList.length);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
          child: Row(
            children: <Widget>[
              _getCircleUi(() {
                setState(() {
                  currentMonthDate = DateTime(
                      currentMonthDate.year, currentMonthDate.month, 0);
                  setListOfDate(currentMonthDate);
                });
              }, Icons.keyboard_arrow_left),
              Expanded(
                child: Center(
                  child: Text(
                    DateFormat("MMMM, yyyy", languageCode).format(
                      currentMonthDate,
                    ),
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
              _getCircleUi(() {
                setState(() {
                  currentMonthDate = DateTime(
                      currentMonthDate.year, currentMonthDate.month + 2, 0);
                  setListOfDate(currentMonthDate);
                });
              }, Icons.keyboard_arrow_right)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 4),
          child: Row(
            children: getDaysNameUI(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Column(
            children: getDaysNoUI(),
          ),
        ),
      ],
    );
  }

  Widget _getCircleUi(VoidCallback onTap, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: onTap,
            child: Icon(
              icon,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getDaysNameUI() {
    List<Widget> listUI = [];
    for (var i = 0; i < 7; i++) {
      listUI.add(
        Get.find<Loc>().isRTL
            ? Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 6.0),
                child: Center(
                  child: Text(
                    DateFormat("EEE", languageCode).format(dateList[i]),
                    textAlign: TextAlign.justify,
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            : Expanded(
                child: Center(
                  child: Text(
                    DateFormat("EEE", languageCode).format(dateList[i]),
                    textAlign: TextAlign.justify,
                    style: TextStyles(context)
                        .getRegularStyle()
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
      );
    }
    return listUI;
  }

  List<Widget> getDaysNoUI() {
    List<Widget> noList = [];
    var cout = 0;
    for (var i = 0; i < dateList.length / 7; i++) {
      List<Widget> listUI = [];
      for (var i = 0; i < 7; i++) {
        final date = dateList[cout];
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            left: isStartDateRadius(date)
                                ? Get.find<Loc>().isRTL
                                    ? 0
                                    : 4
                                : 0,
                            right: isEndDateRadius(date)
                                ? Get.find<Loc>().isRTL
                                    ? 0
                                    : 4
                                : 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: startDate != null && endDate != null
                                ? getIsItStartAndEndDate(date) ||
                                        getIsInRange(date)
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.4)
                                    : Colors.transparent
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Get.find<Loc>().isRTL
                                  ? isEndDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0)
                                  : isStartDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0),
                              topLeft: Get.find<Loc>().isRTL
                                  ? isEndDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0)
                                  : isStartDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0),
                              topRight: Get.find<Loc>().isRTL
                                  ? isStartDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0)
                                  : isEndDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0),
                              bottomRight: Get.find<Loc>().isRTL
                                  ? isStartDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0)
                                  : isEndDateRadius(date)
                                      ? const Radius.circular(24.0)
                                      : const Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        if (currentMonthDate.month == date.month) {
                          var newminimumDate = DateTime(
                              widget.minimumDate.year,
                              widget.minimumDate.month,
                              widget.minimumDate.day - 1);
                          var newmaximumDate = DateTime(
                              widget.maximumDate.year,
                              widget.maximumDate.month,
                              widget.maximumDate.day + 1);
                          if (date.isAfter(newminimumDate) &&
                              date.isBefore(newmaximumDate)) {
                            onDateClick(date);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getIsItStartAndEndDate(date)
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            border: Border.all(
                              color: getIsItStartAndEndDate(date)
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: getIsItStartAndEndDate(date)
                                ? <BoxShadow>[
                                    BoxShadow(
                                        color: Theme.of(context).disabledColor,
                                        blurRadius: 4,
                                        offset: const Offset(0, 0)),
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              "${date.day}",
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(
                                      color: getIsItStartAndEndDate(date)
                                          ? AppTheme.primaryTextColor
                                          : currentMonthDate.month == date.month
                                              ? AppTheme.primaryTextColor
                                              : AppTheme.secondaryTextColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  360
                                              ? 18
                                              : 16,
                                      fontWeight: getIsItStartAndEndDate(date)
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          color: DateTime.now().day == date.day &&
                                  DateTime.now().month == date.month &&
                                  DateTime.now().year == date.year
                              ? getIsInRange(date)
                                  ? Colors.white
                                  : Theme.of(context).primaryColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        cout += 1;
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

  bool getIsInRange(DateTime date) {
    if (startDate != null && endDate != null) {
      if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool getIsItStartAndEndDate(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month &&
        startDate!.year == date.year) {
      return true;
    } else if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month &&
        endDate!.year == date.year) {
      return true;
    } else {
      return false;
    }
  }

  bool isStartDateRadius(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month) {
      return true;
    } else if (date.weekday == 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isEndDateRadius(DateTime date) {
    if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month) {
      return true;
    } else if (date.weekday == 7) {
      return true;
    } else {
      return false;
    }
  }

  void onDateClick(DateTime date) {
    if (startDate == null) {
      startDate = date;
    } else if (startDate != date && endDate == null) {
      endDate = date;
    } else if (startDate!.day == date.day && startDate!.month == date.month) {
      startDate = null;
    } else if (endDate!.day == date.day && endDate!.month == date.month) {
      endDate = null;
    }
    if (startDate == null && endDate != null) {
      startDate = endDate;
      endDate = null;
    }
    if (startDate != null && endDate != null) {
      if (!endDate!.isAfter(startDate!)) {
        var d = startDate;
        startDate = endDate;
        endDate = d;
      }
      if (date.isBefore(startDate!)) {
        startDate = date;
      }
      if (date.isAfter(endDate!)) {
        endDate = date;
      }
    }
    setState(() {
      try {
        widget.startEndDateChange(startDate!, endDate!);
      } catch (_) {}
    });
  }
}
