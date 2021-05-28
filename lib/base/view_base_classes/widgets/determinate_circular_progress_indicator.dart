import 'package:flutter/material.dart';

import '../style/style.dart';

class DeterminateCircularProgressIndicator extends StatefulWidget {
  final Color beginColor;
  // final Color endColor;
  final double strokeWidth;
  final double value;
  final Color positiveColor;
  const DeterminateCircularProgressIndicator({
    Key key,
    this.beginColor,
    // this.endColor,
    @required this.value,
    this.positiveColor,
    this.strokeWidth,
  }) : super(key: key);

  @override
  _DeterminateCircularProgressIndicatorState createState() =>
      _DeterminateCircularProgressIndicatorState();
}

class _DeterminateCircularProgressIndicatorState
    extends State<DeterminateCircularProgressIndicator>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: 1 - widget.value,
      strokeWidth: widget.strokeWidth ?? 8,
      backgroundColor: widget.positiveColor,
      valueColor: ColorTween(
        begin: widget.beginColor ?? greyColor,
        end: widget.beginColor ?? greyColor,
      ).animate(animationController),
    );
  }
}
