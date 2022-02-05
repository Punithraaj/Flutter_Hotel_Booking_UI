import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/utils/helper.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/list_cell_animation_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HotelListViewPage extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final HotelListData hotelData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HotelListViewPage(
      {Key? key,
      required this.hotelData,
      required this.animationController,
      required this.animation,
      required this.callback,
      this.isShowDate: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: CommonCard(
          color: AppTheme.backgroundColor,
          child: ClipRRect(
            //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
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
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width >= 360
                                  ? 12
                                  : 8),
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
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.mapMarkerAlt,
                                                size: 12,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              Text(
                                                " ${hotelData.dist.toStringAsFixed(1)} ",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyles(context)
                                                    .getDescriptionStyle()
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  AppLocalizations(context)
                                                      .of("km_to_city"),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyles(context)
                                                      .getDescriptionStyle()
                                                      .copyWith(
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Helper.ratingStar(),
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "\$${hotelData.perNight}",
                                              textAlign: TextAlign.left,
                                              style: TextStyles(context)
                                                  .getBoldStyle()
                                                  .copyWith(fontSize: 22),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: context
                                                              .read<
                                                                  ThemeProvider>()
                                                              .languageType ==
                                                          LanguageType.ar
                                                      ? 2.0
                                                      : 0.0),
                                              child: Text(
                                                AppLocalizations(context)
                                                    .of("per_night"),
                                                style: TextStyles(context)
                                                    .getDescriptionStyle()
                                                    .copyWith(
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                        try {
                          callback();
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
  }
}
