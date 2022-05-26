import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/room_book_view.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import '../../models/hotel_list_data.dart';

class RoomBookingScreen extends StatefulWidget {
  final String hotelName;

  const RoomBookingScreen({Key? key, required this.hotelName})
      : super(key: key);
  @override
  _RoomBookingScreenState createState() => _RoomBookingScreenState();
}

class _RoomBookingScreenState extends State<RoomBookingScreen>
    with TickerProviderStateMixin {
  List<HotelListData> romeList = HotelListData.romeList;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
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
      body: Column(
        children: <Widget>[
          getAppBarUI(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: romeList.length,
              itemBuilder: (context, index) {
                var count = romeList.length > 10 ? 10 : romeList.length;
                var animation = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();
                //room book view and room data
                return RoomeBookView(
                  roomData: romeList[index],
                  animation: animation,
                  animationController: animationController,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 16,
          right: 16,
          bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          //   ),
          Expanded(
            child: Center(
              child: Text(
                widget.hotelName,
                style: TextStyles(context).getTitleStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              ),
            ),
          ),
          //   )
        ],
      ),
    );
    // );
  }
}
