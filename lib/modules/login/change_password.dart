import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';

class ChangepasswordScreen extends StatefulWidget {
  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  String _errorNewPassword = '';
  String _errorConfirmPassword = '';
  TextEditingController _newController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.arrow_back,
              titleText: AppLocalizations(context).of("change_password"),
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
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
                                  .of("enter_your_new_password"),
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
                      controller: _newController,
                      titleText: AppLocalizations(context).of("new_password"),
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                      hintText:
                          AppLocalizations(context).of('enter_new_password'),
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorNewPassword,
                    ),
                    CommonTextFieldView(
                      controller: _confirmController,
                      titleText:
                          AppLocalizations(context).of("confirm_password"),
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                      hintText: AppLocalizations(context)
                          .of("enter_confirm_password"),
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      onChanged: (String txt) {},
                      errorText: _errorConfirmPassword,
                    ),
                    CommonButton(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                      buttonText: AppLocalizations(context).of("Apply_text"),
                      onTap: () {
                        if (_allValidation()) {
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _allValidation() {
    bool isValid = true;
    if (_newController.text.trim().isEmpty) {
      _errorNewPassword = AppLocalizations(context).of('password_cannot_empty');
      isValid = false;
    } else if (_newController.text.trim().length < 6) {
      _errorNewPassword = AppLocalizations(context).of('valid_new_password');
      isValid = false;
    } else {
      _errorNewPassword = '';
    }
    if (_confirmController.text.trim().isEmpty) {
      _errorConfirmPassword =
          AppLocalizations(context).of('password_cannot_empty');
      isValid = false;
    } else if (_newController.text.trim() != _confirmController.text.trim()) {
      _errorConfirmPassword =
          AppLocalizations(context).of('password_not_match');
      isValid = false;
    } else {
      _errorConfirmPassword = '';
    }
    setState(() {});
    return isValid;
  }
}
