import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';

class CommonSearchBar extends StatelessWidget {
  final String? text;
  final bool enabled, ishsow;
  final double height;
  final IconData? iconData;

  const CommonSearchBar(
      {Key? key,
      this.text,
      this.enabled = false,
      this.height = 48,
      this.iconData,
      this.ishsow = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: Row(
            children: <Widget>[
              ishsow == true
                  ? Icon(
                      iconData,
                      // FontAwesomeIcons.search,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    )
                  : const SizedBox(),
              ishsow == true
                  ? const SizedBox(
                      width: 8,
                    )
                  : const SizedBox(),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  enabled: enabled,
                  onChanged: (String txt) {},
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    errorText: null,
                    border: InputBorder.none,
                    hintText: text,
                    hintStyle: TextStyles(context)
                        .getDescriptionStyle()
                        .copyWith(
                            color: AppTheme.secondaryTextColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
