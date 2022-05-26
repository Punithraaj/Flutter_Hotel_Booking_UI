import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/components/custom_calendar.dart';
import 'package:flutter_hotel_booking_ui/motel_app.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarPopupView extends StatefulWidget {
  final DateTime minimumDate;
  final DateTime maximumDate;
  final bool barrierDismissible;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final Function(DateTime, DateTime) onApplyClick;
  final Function onCancelClick;

  const CalendarPopupView({
    Key? key,
    required this.initialStartDate,
    required this.initialEndDate,
    required this.onApplyClick,
    required this.onCancelClick,
    this.barrierDismissible = true,
    required this.minimumDate,
    required this.maximumDate,
  }) : super(key: key);
  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  DateTime? startDate;
  DateTime? endDate;
  LanguageType _languageType = applicationcontext == null
      ? LanguageType.en
      : applicationcontext!.read<ThemeProvider>().languageType;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    animationController.forward();
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
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: animationController.value,
            child: RemoveFocuse(
              onClick: () {
                if (widget.barrierDismissible) Navigator.pop(context);
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CommonCard(
                    color: AppTheme.backgroundColor,
                    radius: 24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _getFromToUi(
                              AppLocalizations(context).of("From_text"),
                              startDate != null
                                  ? DateFormat(
                                          "EEE, dd MMM",
                                          _languageType
                                              .toString()
                                              .split(".")[1])
                                      .format(startDate!)
                                  : "--/-- ",
                            ),
                            Container(
                              height: 74,
                              width: 1,
                              color: Theme.of(context).dividerColor,
                            ),
                            _getFromToUi(
                              AppLocalizations(context).of("to_text"),
                              endDate != null
                                  ? DateFormat(
                                          "EEE, dd MMM",
                                          _languageType
                                              .toString()
                                              .split(".")[1])
                                      .format(endDate!)
                                  : "--/-- ",
                            ),
                          ],
                        ),
                        Divider(
                          height: 1,
                        ),
                        //Custome calendar page view
                        CustomCalendarView(
                          minimumDate: widget.minimumDate,
                          maximumDate: widget.maximumDate,
                          initialEndDate: widget.initialEndDate,
                          initialStartDate: widget.initialStartDate,
                          startEndDateChange:
                              (DateTime startDateData, DateTime endDateData) {
                            setState(() {
                              startDate = startDateData;
                              endDate = endDateData;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 8),
                          child: CommonButton(
                            buttonText:
                                AppLocalizations(context).of("Apply_date"),
                            onTap: () {
                              try {
                                widget.onApplyClick(startDate!, endDate!);
                                Navigator.pop(context);
                              } catch (e) {}
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getFromToUi(String title, String subtext) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyles(context).getDescriptionStyle().copyWith(
                  fontSize: 16,
                ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subtext,
            style: TextStyles(context).getBoldStyle().copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
