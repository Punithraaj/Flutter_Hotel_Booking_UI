import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';

class CommonCard extends StatefulWidget {
  final Color? color;
  final double radius;
  final Widget? child;

  const CommonCard({Key? key, this.color, this.radius = 16, this.child})
      : super(key: key);
  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //   shadowColor: Theme.of(context).dividerColor,
      elevation: AppTheme.isLightMode ? 4 : 0,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: widget.child,
    );
  }
}
