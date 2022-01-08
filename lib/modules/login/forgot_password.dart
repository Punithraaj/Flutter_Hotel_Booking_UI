import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/utils/validator.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _errorEmail = '';
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: RemoveFocuse(
          onClick: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 24, right: 24),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                AppLocalizations(context)
                                    .of("resend_email_link"),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CommonTextFieldView(
                        controller: _emailController,
                        titleText: AppLocalizations(context).of("your_mail"),
                        errorText: _errorEmail,
                        padding:
                            EdgeInsets.only(left: 24, right: 24, bottom: 24),
                        hintText:
                            AppLocalizations(context).of("enter_your_email"),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String txt) {},
                      ),
                      CommonButton(
                        padding:
                            EdgeInsets.only(left: 24, right: 24, bottom: 16),
                        buttonText: AppLocalizations(context).of("send"),
                        onTap: () {
                          if (_allValidation()) Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return CommonAppbarView(
      iconData: Icons.arrow_back,
      titleText: AppLocalizations(context).of("forgot_your_Password"),
      onBackClick: () {
        Navigator.pop(context);
      },
    );
  }

  bool _allValidation() {
    bool isValid = true;
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = AppLocalizations(context).of('email_cannot_empty');
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = AppLocalizations(context).of('enter_valid_email');
      isValid = false;
    } else {
      _errorEmail = '';
    }
    setState(() {});
    return isValid;
  }
}
