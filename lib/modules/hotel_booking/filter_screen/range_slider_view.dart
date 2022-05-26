import 'package:flutter/material.dart';

class RangeSliderView extends StatefulWidget {
  final Function(RangeValues) onChnageRangeValues;
  final RangeValues values;

  const RangeSliderView(
      {Key? key, required this.values, required this.onChnageRangeValues})
      : super(key: key);
  @override
  _RangeSliderViewState createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  late RangeValues _values;

  @override
  void initState() {
    _values = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: _values.start.round(),
                    child: SizedBox(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      "\$${_values.start.round()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1000 - _values.start.round(),
                    child: SizedBox(),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: _values.end.round(),
                    child: SizedBox(),
                  ),
                  Container(
                    width: 54,
                    child: Text(
                      "\$${_values.end.round()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1000 - _values.end.round(),
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
                //   rangeThumbShape: CustomRangeThumbShape(),
                ),
            child: RangeSlider(
              values: _values,
              min: 10.0,
              max: 1000.0,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              divisions: 1000,
              onChanged: (RangeValues values) {
                try {
                  setState(() {
                    _values = values;
                  });
                  widget.onChnageRangeValues(_values);
                } catch (e) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
