import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';

class DataView extends StatelessWidget {
  final String? roomdata;

  final String? peopledata;

  const DataView({
    Key? key,
    this.roomdata,
    this.peopledata,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          roomdata!,
          // "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
          style: TextStyles(context).getRegularStyle(),
        ),
        const Text("Room"),
        const Text("-"),
        Text(
          peopledata!,
          // "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
          style: TextStyles(context).getRegularStyle(),
        ),
        const Text("People"),
      ],
    );
  }
}
