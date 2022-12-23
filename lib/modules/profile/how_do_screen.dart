import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/constants/text_styles.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';
import '../../models/setting_list_data.dart';

class HowDoScreen extends StatefulWidget {
  final String title;

  const HowDoScreen({Key? key, this.title = ""}) : super(key: key);
  @override
  State<HowDoScreen> createState() => _HowDoScreenState();
}

class _HowDoScreenState extends State<HowDoScreen> {
  List<SettingsListData> subHelpList = SettingsListData.subHelpList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              titleText: "How do i cancle my rooms reservation",
              iconData: Icons.arrow_back,
              onBackClick: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: 16 + MediaQuery.of(context).padding.bottom),
                itemCount: subHelpList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: subHelpList[index].isSelected ? () {} : null,
                    child: Column(
                      children: <Widget>[
                        Text(subHelpList[index].titleTxt),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: subHelpList[index].titleTxt != ""
                                    ? Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          subHelpList[index].titleTxt,
                                          style: TextStyles(context)
                                              .getBoldStyle()
                                              .copyWith(fontSize: 18),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 8,
                                            bottom: 16),
                                        child: Text(
                                          subHelpList[index].subTxt,
                                          style: TextStyles(context)
                                              .getRegularStyle()
                                              .copyWith(
                                                fontSize: 16,
                                                color: subHelpList[index]
                                                        .isSelected
                                                    ? AppTheme.primaryColor
                                                    : AppTheme
                                                        .secondaryTextColor,
                                              ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        subHelpList[index].isSelected
                            ? const Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Divider(
                                  height: 1,
                                ),
                              )
                            : const SizedBox()
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
