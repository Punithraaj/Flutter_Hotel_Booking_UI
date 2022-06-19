import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/localfiles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';

class HotelRoomeList extends StatefulWidget {
  @override
  _HotelRoomeListState createState() => _HotelRoomeListState();
}

class _HotelRoomeListState extends State<HotelRoomeList> {
  List<String> photosList = [
    Localfiles.hotel_room_1,
    Localfiles.hotel_room_2,
    Localfiles.hotel_room_3,
    Localfiles.hotel_room_4,
    Localfiles.hotel_room_5,
    Localfiles.hotel_room_6,
    Localfiles.hotel_room_7,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 8, right: 16, left: 16),
        itemCount: photosList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    photosList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
