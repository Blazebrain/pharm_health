import 'package:flutter/material.dart';

import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';

class LongButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color fillColor;
  final Color textColor;
  final Color outlineColor;
  final double height;
  final double width;
  final double borderRadius;
  final icon;

  const LongButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.icon,
    this.fillColor,
    this.textColor,
    this.outlineColor,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  factory LongButton.purple({
    @required Function() onPressed,
    @required String label,
    double height,
    double width,
    double borderRadius,
    final icon,
  }) {
    return LongButton(
      onPressed: onPressed,
      label: label,
      fillColor: droPurpleColor,
      textColor: textWhiteColor,
      height: height,
      width: width,
      borderRadius: borderRadius,
      icon: icon,
    );
  }

  factory LongButton.white({
    @required Function() onPressed,
    @required String label,
    double height,
    Color color = textWhiteColor,
    double width,
    double borderRadius,
    final icon,
  }) {
    return LongButton(
      onPressed: onPressed,
      label: label,
      fillColor: textWhiteColor,
      textColor: color,
      outlineColor: color,
      height: height,
      borderRadius: borderRadius,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      fillColor: fillColor ?? droPurpleColor,
      constraints: BoxConstraints.tightFor(
        height: height ?? 48,
        width: width ?? MediaQuery.of(context).size.width.clamp(240.0, 560.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        side: outlineColor == null
            ? BorderSide.none
            : BorderSide(
                color: outlineColor,
                width: 1,
              ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: FittedBox(
        child: Row(
          children: [
            if (icon != null)
              Image(
                image: icon,
                height: 25,
                color: textWhiteColor,
              ),
            if (icon != null) const SizedBox(width: 8),
            SimpleText(
              '$label',
              size: 16,
              color: textColor ?? textWhiteColor,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
