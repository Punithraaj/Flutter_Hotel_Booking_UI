import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import '../../models/setting_list_data.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  List<SettingsListData> currencyList = SettingsListData.currencyList;

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
              titleText: "Currency",
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: 16 + MediaQuery.of(context).padding.bottom),
                itemCount: currencyList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, currencyList[index].subTxt);
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    currencyList[index].titleTxt,
                                    style: TextStyles(context)
                                        .getRegularStyle()
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  currencyList[index].subTxt,
                                  style: TextStyles(context)
                                      .getDescriptionStyle()
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Divider(
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
