import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/constants/helper.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';

class MapHotelListView extends StatelessWidget {
  final VoidCallback callback;
  final HotelListData hotelData;

  const MapHotelListView(
      {Key? key, required this.hotelData, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 16),
      child: CommonCard(
        color: AppTheme.scaffoldBackgroundColor,
        radius: 16,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: AspectRatio(
            aspectRatio: 2.7,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 0.90,
                      child: Image.asset(
                        hotelData.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              hotelData.titleTxt,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style:
                                  TextStyles(context).getBoldStyle().copyWith(
                                        fontSize: 16,
                                      ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              hotelData.subTxt,
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Helper.ratingStar(),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "\$${hotelData.perNight}",
                                        textAlign: TextAlign.left,
                                        style: TextStyles(context)
                                            .getBoldStyle()
                                            .copyWith(
                                              fontSize: 22,
                                            ),
                                      ),
                                      Text(
                                        Loc.alized.per_night,
                                        style: TextStyles(context)
                                            .getDescriptionStyle()
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    onTap: () {
                      callback();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
