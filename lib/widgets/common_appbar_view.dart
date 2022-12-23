import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';

class CommonAppbarView extends StatelessWidget {
  final double? topPadding;
  final Widget? backWidget;
  final String titleText;
  final VoidCallback? onBackClick;
  final IconData? iconData;

  const CommonAppbarView({
    Key? key,
    this.topPadding,
    this.onBackClick,
    this.titleText = '',
    this.backWidget,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = topPadding ?? MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppBar().preferredSize.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: SizedBox(
                width: AppBar().preferredSize.height - 8,
                height: AppBar().preferredSize.height - 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: onBackClick,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: backWidget ??
                          Icon(
                            iconData,
                            color: AppTheme.primaryTextColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 24, right: 24),
            child: Text(titleText, style: TextStyles(context).getTitleStyle()),
          ),
        ],
      ),
    );
  }
}
