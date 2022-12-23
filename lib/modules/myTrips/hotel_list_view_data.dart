import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_hotel_booking_ui/constants/helper.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/list_cell_animation_view.dart';

class HotelListViewData extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final HotelListData hotelData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HotelListViewData(
      {Key? key,
      required this.hotelData,
      required this.animationController,
      required this.animation,
      required this.callback,
      this.isShowDate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          onTap: () {
            try {
              callback();
            } catch (_) {}
          },
          child: Row(
            children: <Widget>[
              isShowDate ? getUI(context) : const SizedBox(),
              CommonCard(
                color: AppTheme.backgroundColor,
                radius: 16,
                child: SizedBox(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        hotelData.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              !isShowDate ? getUI(context) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getUI(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        padding: EdgeInsets.only(
            left: !isShowDate ? 16 : 8,
            top: 8,
            bottom: 8,
            right: isShowDate ? 16 : 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isShowDate ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              hotelData.titleTxt,
              maxLines: 2,
              textAlign: isShowDate ? TextAlign.right : TextAlign.left,
              style: TextStyles(context).getBoldStyle().copyWith(
                    fontSize: 16,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              hotelData.subTxt,
              style: TextStyles(context).getDescriptionStyle().copyWith(
                    fontSize: 14,
                  ),
            ),
            Text(
              Helper.getDateText(hotelData.date!),
              maxLines: 2,
              textAlign: isShowDate ? TextAlign.right : TextAlign.left,
              style: TextStyles(context).getRegularStyle().copyWith(
                    fontSize: 12,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              Helper.getRoomText(hotelData.roomData!),
              maxLines: 2,
              textAlign: isShowDate ? TextAlign.right : TextAlign.left,
              style: TextStyles(context).getRegularStyle().copyWith(
                    fontSize: 12,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: FittedBox(
                child: SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: isShowDate
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: isShowDate
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationDot,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            " ${hotelData.dist.toStringAsFixed(1)}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                          Text(
                            Loc.alized.km_to_city,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                      Helper.ratingStar(),
                      Row(
                        mainAxisAlignment: isShowDate
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "\$${hotelData.perNight}",
                            textAlign: TextAlign.left,
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Get.find<Loc>().isRTL ? 4.0 : 2.0),
                            child: Text(
                              Loc.alized.per_night,
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
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
  }
}
