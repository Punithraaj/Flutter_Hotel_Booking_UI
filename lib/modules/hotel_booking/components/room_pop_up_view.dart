import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/logic/controllers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/models/room_data.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';

class RoomPopupView extends StatefulWidget {
  final Function(RoomData) onChnage;
  final bool barrierDismissible;
  final RoomData roomData;

  const RoomPopupView({
    Key? key,
    required this.barrierDismissible,
    required this.onChnage,
    required this.roomData,
  }) : super(key: key);
  @override
  State<RoomPopupView> createState() => _RoomPopupViewState();
}

class _RoomPopupViewState extends State<RoomPopupView>
    with TickerProviderStateMixin {
  PopupTextType popupTextType = PopupTextType.no;
  late AnimationController animationController;

  DateTime? startDate;
  DateTime? endDate;
  RoomData? _roomData;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    animationController.forward();
    _roomData = RoomData(
      widget.roomData.numberRoom,
      widget.roomData.people,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Get.find<ThemeController>();
    return Center(
      child: Scaffold(
        backgroundColor: appTheme.isLightMode
            ? Colors.transparent
            : Theme.of(context).backgroundColor.withOpacity(0.6),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController.value,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CommonCard(
                    color: AppTheme.backgroundColor,
                    radius: 24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            Loc.alized.room_selected,
                            style: TextStyles(context).getBoldStyle().copyWith(
                                  fontSize: 16,
                                ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        getRowView(Loc.alized.number_room,
                            _roomData!.numberRoom, PopupTextType.no),
                        getRowView(Loc.alized.people_data, _roomData!.people,
                            PopupTextType.ad),
                        // getRowView("Children", " (0-17)", ch, PopupTextType.ch),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 24),
                          child: CommonButton(
                            buttonText: Loc.alized.apply_date,
                            onTap: () {
                              try {
                                widget.onChnage(
                                  _roomData!,
                                );
                                Navigator.pop(context);
                              } catch (_) {}
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getRowView(String txt, int count, PopupTextType popupTextType) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Divider(
                            height: 1,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    txt,
                                    textAlign: TextAlign.left,
                                    style: TextStyles(context)
                                        .getBoldStyle()
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              onTap: () {
                                setState(() {
                                  if (popupTextType == PopupTextType.no) {
                                    _roomData!.numberRoom += 1;
                                  } else if (popupTextType ==
                                      PopupTextType.ad) {
                                    _roomData!.people += 1;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 28,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "  $count  ",
                            style: TextStyles(context)
                                .getRegularStyle()
                                .copyWith(),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              onTap: () {
                                setState(() {
                                  if (popupTextType == PopupTextType.no) {
                                    _roomData!.numberRoom -= 1;
                                    if (_roomData!.numberRoom < 0) {
                                      _roomData!.numberRoom = 0;
                                    }
                                  } else {
                                    _roomData!.people -= 1;
                                    if (_roomData!.people < 0) {
                                      _roomData!.people = 0;
                                    }
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 28,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum PopupTextType { no, ad, ch }
