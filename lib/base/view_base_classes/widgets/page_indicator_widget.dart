import 'package:flutter/material.dart';

import '../style/style.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key key,
    @required this.count,
    @required this.value,
    this.size = 8,
    this.spacing = 16,
    this.alignment,
  }) : super(key: key);

  final int count;
  final int value;
  final double size;
  final double spacing;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < count; i++)
          AnimatedContainer(
            height: size,
            width: size,
            margin: EdgeInsets.fromLTRB(
              0,
              spacing,
              i == count - 1 ? 0 : spacing,
              spacing,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              color: i == value ? droPurpleColor : const Color(0xFFCCCACA),
            ),
            duration: const Duration(milliseconds: 700),
          )
      ],
    );
  }
}
