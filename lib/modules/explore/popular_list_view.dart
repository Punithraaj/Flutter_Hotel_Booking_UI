import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/category_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/bottom_top_move_animation_view.dart';
import '../../models/hotel_list_data.dart';

class PopularListView extends StatefulWidget {
  final Function(int) callBack;
  final AnimationController animationController;
  const PopularListView(
      {Key? key, required this.callBack, required this.animationController})
      : super(key: key);
  @override
  State<PopularListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView>
    with TickerProviderStateMixin {
  var popularList = HotelListData.popularList;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomTopMoveAnimationView(
      animationController: animationController!,
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 24, left: 8),
                itemCount: popularList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var count = popularList.length > 10 ? 10 : popularList.length;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController?.forward();
                  //Population animation photo and text view
                  return CategoryView(
                    popularList: popularList[index],
                    animation: animation,
                    animationController: animationController!,
                    callback: () {
                      widget.callBack(index);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
