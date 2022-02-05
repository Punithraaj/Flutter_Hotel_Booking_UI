class PopularFilterListData {
  String titleTxt;
  bool isSelected;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<PopularFilterListData> popularFList = [
    PopularFilterListData(
      titleTxt: 'free_breakfast',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'free_Parking',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'pool_text',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'pet_friendlly',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Free_Wifi',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'all_text',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Home_text',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'villa_data',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'hotel_data',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Resort_data',
      isSelected: false,
    ),
  ];
}
