import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/review_data_view.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/utils/helper.dart';
import 'package:flutter_hotel_booking_ui/utils/localfiles.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/hotel_list_data.dart';
import 'hotel_roome_list.dart';
import 'rating_view.dart';

class HotelDetailes extends StatefulWidget {
  final HotelListData hotelData;

  const HotelDetailes({Key? key, required this.hotelData}) : super(key: key);
  @override
  _HotelDetailesState createState() => _HotelDetailesState();
}

class _HotelDetailesState extends State<HotelDetailes>
    with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  var hoteltext1 =
      "Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum...";
  var hoteltext2 =
      "Featuring a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum a fitness center, Grand Royale Park Hote is located in Sweden, 4.7 km frome National Museum";
  bool isFav = false;
  bool isReadless = false;
  late AnimationController animationController;
  var imageHieght = 0.0;
  late AnimationController _animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    animationController.forward();
    scrollController.addListener(() {
      if (mounted) {
        if (scrollController.offset < 0) {
          // we static set the just below half scrolling values
          _animationController.animateTo(0.0);
        } else if (scrollController.offset > 0.0 &&
            scrollController.offset < imageHieght) {
          // we need around half scrolling values
          if (scrollController.offset < ((imageHieght / 1.2))) {
            _animationController
                .animateTo((scrollController.offset / imageHieght));
          } else {
            // we static set the just above half scrolling values "around == 0.22"
            _animationController.animateTo((imageHieght / 1.2) / imageHieght);
          }
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    imageHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CommonCard(
            radius: 0,
            color: AppTheme.scaffoldBackgroundColor,
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.only(top: 24 + imageHieght),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  // Hotel title and animation view
                  child: getHotelDetails(isInList: true),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations(context).of("summary"),
                          style: TextStyles(context).getBoldStyle().copyWith(
                                fontSize: 14,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 8),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: !isReadless ? hoteltext1 : hoteltext2,
                          style: TextStyles(context)
                              .getDescriptionStyle()
                              .copyWith(
                                fontSize: 14,
                              ),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: !isReadless
                              ? AppLocalizations(context).of("read_more")
                              : AppLocalizations(context).of("less"),
                          style: TextStyles(context).getRegularStyle().copyWith(
                              color: AppTheme.primaryColor, fontSize: 14),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                isReadless = !isReadless;
                              });
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 8,
                    bottom: 16,
                  ),
                  // overall rating view
                  child: RatingView(hotelData: widget.hotelData),
                ),
                _getPhotoReviewUi(
                    "room_photo", 'view_all', Icons.arrow_forward, () {}),

                // Hotel inside photo view
                HotelRoomeList(),
                _getPhotoReviewUi("reviews", 'view_all', Icons.arrow_forward,
                    () {
                  NavigationServices(context).gotoReviewsListScreen();
                }),

                // feedback&Review data view
                for (var i = 0; i < 2; i++)
                  ReviewsView(
                    reviewsList: HotelListData.reviewsList[i],
                    animation: animationController,
                    animationController: animationController,
                    callback: () {},
                  ),

                SizedBox(
                  height: 16,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Image.asset(
                        Localfiles.mapImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 34, right: 10),
                      child: CommonCard(
                        color: AppTheme.primaryColor,
                        radius: 36,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            FontAwesomeIcons.mapPin,
                            color: Theme.of(context).backgroundColor,
                            size: 28,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 16),
                  child: CommonButton(
                    buttonText: AppLocalizations(context).of("book_now"),
                    onTap: () {
                      NavigationServices(context)
                          .gotoRoomBookingScreen(widget.hotelData.titleTxt);
                    },
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),

          // backgrouund image and Hotel name and thier details and more details animation view
          _backgraoundImageUI(widget.hotelData),

          // Arrow back Ui
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
              height: AppBar().preferredSize.height,
              child: Row(
                children: <Widget>[
                  _getAppBarUi(Theme.of(context).disabledColor.withOpacity(0.4),
                      Icons.arrow_back, AppTheme.backgroundColor, () {
                    if (scrollController.offset != 0.0) {
                      scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 480),
                          curve: Curves.easeInOutQuad);
                    } else {
                      Navigator.pop(context);
                    }
                  }),
                  Expanded(
                    child: SizedBox(),
                  ),
                  // like and unlike view
                  _getAppBarUi(
                      AppTheme.backgroundColor,
                      isFav ? Icons.favorite : Icons.favorite_border,
                      AppTheme.primaryColor, () {
                    setState(() {
                      isFav = !isFav;
                    });
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getAppBarUi(
      Color color, IconData icon, Color iconcolor, VoidCallback onTap) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Container(
          width: AppBar().preferredSize.height - 8,
          height: AppBar().preferredSize.height - 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: iconcolor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPhotoReviewUi(
      String title, String view, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              AppLocalizations(context).of(title),
              // "Photos",
              style: TextStyles(context).getBoldStyle().copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations(context).of(view),
                      //  'View all',
                      textAlign: TextAlign.left,
                      style: TextStyles(context).getBoldStyle().copyWith(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        icon,
                        //Icons.arrow_forward,
                        size: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _backgraoundImageUI(HotelListData hotelData) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          var opecity = 1.0 -
              (_animationController.value >= ((imageHieght / 1.2) / imageHieght)
                  ? 1.0
                  : _animationController.value);
          return SizedBox(
            height: imageHieght * (1.0 - _animationController.value),
            child: Stack(
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              hotelData.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: opecity,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                color: Colors.black12,
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, top: 8),
                                      child: getHotelDetails(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          bottom: 16,
                                          top: 16),
                                      child: CommonButton(
                                          buttonText: AppLocalizations(context)
                                              .of("book_now"),
                                          onTap: () {
                                            NavigationServices(context)
                                                .gotoRoomBookingScreen(
                                                    widget.hotelData.titleTxt);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                color: Colors.black12,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(38)),
                                    onTap: () {
                                      try {
                                        scrollController.animateTo(
                                            MediaQuery.of(context).size.height -
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.fastOutSlowIn);
                                      } catch (e) {}
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 4,
                                          bottom: 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations(context)
                                                .of("more_details"),
                                            style: TextStyles(context)
                                                .getBoldStyle()
                                                .copyWith(
                                                  color: Colors.white,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getHotelDetails({bool isInList = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.hotelData.titleTxt,
                textAlign: TextAlign.left,
                style: TextStyles(context).getBoldStyle().copyWith(
                      fontSize: 22,
                      color: isInList ? AppTheme.fontcolor : Colors.white,
                    ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotelData.subTxt,
                    style: TextStyles(context).getRegularStyle().copyWith(
                          fontSize: 14,
                          color: isInList
                              ? Theme.of(context).disabledColor.withOpacity(0.5)
                              : Colors.white,
                        ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 12,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    "${widget.hotelData.dist.toStringAsFixed(1)}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles(context).getRegularStyle().copyWith(
                          fontSize: 14,
                          color: isInList
                              ? Theme.of(context).disabledColor.withOpacity(0.5)
                              : Colors.white,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations(context).of("km_to_city"),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles(context).getRegularStyle().copyWith(
                            fontSize: 14,
                            color: isInList
                                ? Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.5)
                                : Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              isInList
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          Helper.ratingStar(),
                          Text(
                            " ${widget.hotelData.reviews}",
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontSize: 14,
                                      color: isInList
                                          ? Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.5)
                                          : Colors.white,
                                    ),
                          ),
                          Text(
                            AppLocalizations(context).of("reviews"),
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      fontSize: 14,
                                      color: isInList
                                          ? Theme.of(context).disabledColor
                                          : Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "\$${widget.hotelData.perNight}",
              textAlign: TextAlign.left,
              style: TextStyles(context).getBoldStyle().copyWith(
                    fontSize: 22,
                    color: isInList
                        ? Theme.of(context).textTheme.bodyText1!.color
                        : Colors.white,
                  ),
            ),
            Text(
              AppLocalizations(context).of("per_night"),
              style: TextStyles(context).getRegularStyle().copyWith(
                    fontSize: 14,
                    color: isInList
                        ? Theme.of(context).disabledColor
                        : Colors.white,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
