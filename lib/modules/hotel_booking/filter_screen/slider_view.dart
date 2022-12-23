import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/app_localizations.dart';

class SliderView extends StatefulWidget {
  final Function(double) onChnagedistValue;
  final double distValue;

  const SliderView(
      {Key? key, required this.onChnagedistValue, required this.distValue})
      : super(key: key);
  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 50.0;

  @override
  void initState() {
    distValue = widget.distValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: distValue.round(),
              child: const SizedBox(),
            ),
            SizedBox(
              width: 170,
              child: Row(
                children: [
                  Text(
                    Loc.alized.less_than,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      (distValue / 10).toStringAsFixed(1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    Loc.alized.km_text,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 100 - distValue.round(),
              child: const SizedBox(),
            ),
          ],
        ),
        Slider(
          onChanged: (value) {
            setState(() {
              distValue = value;
            });
            try {
              widget.onChnagedistValue(distValue);
            } catch (_) {}
          },
          min: 0.0,
          max: 100.0,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey.withOpacity(0.4),
          //   divisions: 100,
          value: distValue,
        ),
      ],
    );
  }
}

// class CustomThumbShape extends SliderComponentShape {
//   static const double _thumbSize = 3.0;
//   static const double _disabledThumbSize = 3.0;

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return isEnabled
//         ? const Size.fromRadius(_thumbSize)
//         : const Size.fromRadius(_disabledThumbSize);
//   }

//   static final Animatable<double> sizeTween = Tween<double>(
//     begin: _disabledThumbSize,
//     end: _thumbSize,
//   );

//   double convertRadiusToSigma(double radius) {
//     return radius * 0.57735 + 0.5;
//   }

//   @override
//   void paint(PaintingContext context, Offset center,
//       {Animation<double> activationAnimation,
//       Animation<double> enableAnimation,
//       bool isDiscrete,
//       TextPainter labelPainter,
//       RenderBox parentBox,
//       SliderThemeData sliderTheme,
//       TextDirection textDirection,
//       double value,
//       double textScaleFactor,
//       Size sizeWithOverflow}) {
//     final Canvas canvas = context.canvas;
//     final ColorTween colorTween = ColorTween(
//       begin: sliderTheme.disabledThumbColor,
//       end: sliderTheme.thumbColor,
//     );
//     canvas.drawPath(
//         Path()
//           ..addOval(Rect.fromPoints(Offset(center.dx + 12, center.dy + 12),
//               Offset(center.dx - 12, center.dy - 12)))
//           ..fillType = PathFillType.evenOdd,
//         Paint()
//           ..color = Colors.black.withOpacity(0.5)
//           ..maskFilter =
//               MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

//     var cPaint = new Paint();
//     cPaint..color = Colors.white;
//     cPaint..strokeWidth = 14 / 2;
//     canvas.drawCircle(Offset(center.dx, center.dy), 12, cPaint);
//     cPaint..color = colorTween.evaluate(enableAnimation);
//     canvas.drawCircle(Offset(center.dx, center.dy), 10, cPaint);
//   }
// }
