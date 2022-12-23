import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import '../../models/setting_list_data.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<SettingsListData> countryList = [];

  @override
  void initState() {
    getCountryList();
    super.initState();
  }

  void getCountryList() async {
    countryList = SettingsListData().getCountryListFromJson(json.decode(
        await DefaultAssetBundle.of(context)
            .loadString("assets/json/countryList.json")));
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {});
  }

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
              titleText: "Country",
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: countryList.isEmpty
                  ? const Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 16 + MediaQuery.of(context).padding.bottom),
                      itemCount: countryList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, countryList[index].titleTxt);
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          countryList[index].titleTxt,
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
                                        countryList[index].subTxt,
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
