import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    required this.title,
    this.description = '',
    this.topWidget,
    this.descriptionWidget,
    this.actionButtonList,
    this.isVerical = false,
    this.onCloseClick,
  });

  final VoidCallback? onCloseClick;
  final String title, description;
  final Widget? topWidget;
  final Widget? descriptionWidget;
  final List<Widget>? actionButtonList;
  final bool isVerical;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 480));
    WidgetsBinding.instance!.addPostFrameCallback((_) => _startAnimation());
    super.initState();
  }

  void _startAnimation() {
    animationController!.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return ScaleTransition(
          scale: CurvedAnimation(
              parent: animationController!,
              curve: Interval(0.0, 1.0, curve: Curves.easeOutBack)),
          child: Dialog(
            clipBehavior: Clip.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: SizedBox(
              width: 380,
              child: dialogContent(context),
            ),
          ),
        );
      },
    );
  }

  Widget dialogContent(BuildContext context) {
    return Card(
      color: AppTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: (widget.topWidget == null)
                  ? null
                  : const BorderRadius.only(
                      bottomLeft: Radius.elliptical(180, 32),
                      bottomRight: Radius.elliptical(180, 32),
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  if (widget.topWidget != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                          height: 60, child: Center(child: widget.topWidget)),
                    ),
                  if (widget.title != '')
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Center(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyles(context).getTitleStyle(),
                        ),
                      ),
                    )
                  else
                    const SizedBox()
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // To make the card compact
                    children: <Widget>[
                      if (widget.descriptionWidget != null)
                        widget.descriptionWidget!
                      else
                        widget.description != ''
                            ? Text(
                                widget.description,
                                textAlign: TextAlign.center,
                                style: TextStyles(context)
                                    .getRegularStyle()
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                              )
                            : const SizedBox(),
                      SizedBox(height: widget.description != '' ? 16.0 : 8),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                ),
                if (widget.actionButtonList != null &&
                    widget.actionButtonList!.isNotEmpty)
                  widget.actionButtonList!.length > 2 || widget.isVerical
                      ? Column(
                          children: getActionButtonsList(context),
                        )
                      : Row(
                          children: getActionButtonsList(context),
                        )
                else
                  const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getActionButtonsList(BuildContext context) {
    if (widget.actionButtonList != null) {
      if (widget.actionButtonList!.length > 2 || widget.isVerical) {
        final List<Widget> list = <Widget>[];
        for (int i = 0; i < widget.actionButtonList!.length; i++) {
          list.add(widget.actionButtonList![i]);
          if (i != widget.actionButtonList!.length) {
            list.add(const Divider(
              height: 1,
            ));
          }
        }
        return list;
      } else if (widget.actionButtonList!.length == 2) {
        final List<Widget> list = <Widget>[];
        list.add(
          Expanded(child: widget.actionButtonList![0]),
        );
        list.add(
          Container(
            width: 0.6,
            height: 48,
            color: Theme.of(context).dividerColor,
          ),
        );
        list.add(Expanded(child: widget.actionButtonList![1]));
        return list;
      } else {
        final List<Widget> list = <Widget>[];
        list.add(
          Expanded(child: widget.actionButtonList![0]),
        );
        return list;
      }
    } else {
      return <Widget>[];
    }
  }
}

class CustomDialogActionButton extends StatelessWidget {
  const CustomDialogActionButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String buttonText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final btnColor = color ?? Theme.of(context).primaryColor;
    return InkWell(
      splashColor: btnColor.withOpacity(0.1),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 48,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.button!.copyWith(
                color: btnColor,
              ),
        ),
      ),
    );
  }
}

class CustomTopIconView extends StatelessWidget {
  const CustomTopIconView({Key? key, required this.topWidget, this.bgColor})
      : super(key: key);

  final Widget topWidget;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Card(
        color: (bgColor == null) ? Theme.of(context).primaryColor : bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: topWidget,
        ),
      ),
    );
  }
}
