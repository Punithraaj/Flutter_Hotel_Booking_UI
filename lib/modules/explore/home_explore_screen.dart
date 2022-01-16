import 'package:flutter/material.dart';

class HomeExploreScreen extends StatefulWidget {
  final AnimationController animationController;

  HomeExploreScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  _HomeExploreScreenState createState() => _HomeExploreScreenState();
}

class _HomeExploreScreenState extends State<HomeExploreScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hotel Explorer"),
      ),
    );
  }
}
