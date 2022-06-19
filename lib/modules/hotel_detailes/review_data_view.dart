import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/list_cell_animation_view.dart';

class ReviewsView extends StatelessWidget {
  final VoidCallback callback;
  final HotelListData reviewsList;
  final AnimationController animationController;
  final Animation<double> animation;

  const ReviewsView({
    Key? key,
    required this.reviewsList,
    required this.animationController,
    required this.animation,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      yTranslation: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 48,
                    child: CommonCard(
                      radius: 8,
                      color: AppTheme.whiteColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            reviewsList.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      reviewsList.titleTxt,
                      style: TextStyles(context).getBoldStyle().copyWith(
                            fontSize: 14,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations(context).of("last_update"),
                          style: new TextStyles(context)
                              .getDescriptionStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                                color: Theme.of(context).disabledColor,
                              ),
                        ),
                        Text(
                          reviewsList.dateTxt,
                          style: new TextStyles(context)
                              .getDescriptionStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                                color: Theme.of(context).disabledColor,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "(${reviewsList.rating})",
                          style: new TextStyles(context)
                              .getRegularStyle()
                              .copyWith(
                                fontWeight: FontWeight.w100,
                              ),
                        ),
                        //   SmoothStarRating(
                        //     allowHalfRating: true,
                        //     starCount: 5,
                        //     rating: reviewsList.rating / 2,
                        //     size: 16,
                        //     color: Theme.of(context).primaryColor,
                        //     borderColor: Theme.of(context).primaryColor,
                        //   ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                reviewsList.subTxt,
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).disabledColor,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            AppLocalizations(context).of("reply"),
                            textAlign: TextAlign.left,
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          SizedBox(
                            height: 38,
                            width: 26,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
