import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/localfiles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';

class HotelRoomeList extends StatefulWidget {
  const HotelRoomeList({Key? key}) : super(key: key);

  @override
  State<HotelRoomeList> createState() => _HotelRoomeListState();
}

class _HotelRoomeListState extends State<HotelRoomeList> {
  List<String> photosList = [
    Localfiles.hotelRoom_1,
    Localfiles.hotelRoom_2,
    Localfiles.hotelRoom_3,
    Localfiles.hotelRoom_4,
    Localfiles.hotelRoom_5,
    Localfiles.hotelRoom_6,
    Localfiles.hotelRoom_7,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
