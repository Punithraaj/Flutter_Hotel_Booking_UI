import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import '../../models/hotel_list_data.dart';

class RatingView extends StatelessWidget {
  final HotelListData hotelData;

  const RatingView({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: AppTheme.backgroundColor,
      radius: 16,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 60,
                  child: Text(
                    (hotelData.rating * 2).toStringAsFixed(1),
                    textAlign: TextAlign.left,
                    style: TextStyles(context).getBoldStyle().copyWith(
                          fontSize: 38,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Loc.alized.overall_rating,
                          textAlign: TextAlign.left,
                          style: TextStyles(context).getRegularStyle().copyWith(
                                // fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.8),
                              ),
                        ),
                        // SmoothStarRating(
                        //   allowHalfRating: true,
                        //   starCount: 5,
                        //   rating: hotelData.rating,
                        //   size: 16,
                        //   color: Theme.of(context).primaryColor,
                        //   borderColor: Theme.of(context).primaryColor,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            getBarUI('room', 95.0, context),
            const SizedBox(
              height: 4,
            ),
            getBarUI('service', 80.0, context),
            const SizedBox(
              height: 4,
            ),
            getBarUI('location', 65.0, context),
            const SizedBox(
              height: 4,
            ),
            getBarUI('price', 85, context),
          ],
        ),
      ),
    );
  }

  Widget getBarUI(String text, double percent, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 60,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyles(context).getRegularStyle().copyWith(
                  // fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Theme.of(context).disabledColor.withOpacity(0.8),
                ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: percent.toInt(),
                child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: SizedBox(
                      height: 4,
                      child: CommonCard(
                        color: AppTheme.primaryColor,
                        radius: 8,
                      ),
                    )),
              ),
              Expanded(
                flex: 100 - percent.toInt(),
                child: const SizedBox(),
              )
            ],
          ),
        )
      ],
    );
  }
}
