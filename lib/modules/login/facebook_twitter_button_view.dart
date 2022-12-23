import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';

class FacebookTwitterButtonView extends StatelessWidget {
  const FacebookTwitterButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fTButtonUI();
  }

  Widget _fTButtonUI() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: CommonButton(
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xff3c5799),
            buttonTextWidget: _buttonTextUI(),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CommonButton(
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xff05a9f0),
            buttonTextWidget: _buttonTextUI(isFacebook: false),
          ),
        ),
        const SizedBox(
          width: 24,
        )
      ],
    );
  }

  Widget _buttonTextUI({bool isFacebook = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(isFacebook ? FontAwesomeIcons.facebookF : FontAwesomeIcons.twitter,
            size: 20, color: Colors.white),
        const SizedBox(
          width: 4,
        ),
        Text(
          isFacebook ? "Facebook" : "Twitter",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
