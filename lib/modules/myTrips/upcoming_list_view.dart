import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/hotel_list_view.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import '../../models/hotel_list_data.dart';

class UpcomingListView extends StatefulWidget {
  final AnimationController animationController;

  const UpcomingListView({Key? key, required this.animationController})
      : super(key: key);
  @override
  State<UpcomingListView> createState() => _UpcomingListViewState();
}

class _UpcomingListViewState extends State<UpcomingListView> {
  var hotelList = HotelListData.hotelList;

  @override
  void initState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotelList.length,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var count = hotelList.length > 10 ? 10 : hotelList.length;
        var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * index, 1.0,
                curve: Curves.fastOutSlowIn)));
        widget.animationController.forward();
        //Upcoming UI view and hotel list
        return HotelListView(
          callback: () {
            NavigationServices(context)
                .gotoRoomBookingScreen(hotelList[index].titleTxt);
          },
          hotelData: hotelList[index],
          animation: animation,
          animationController: widget.animationController,
          isShowDate: true,
        );
      },
    );
  }
}
