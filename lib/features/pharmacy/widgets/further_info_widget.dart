import 'package:flutter/material.dart';

import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';

class FurtherInfoWidget extends StatelessWidget {
  final parameterImage;
  final String parameterTitle;
  final String parameter;

  const FurtherInfoWidget(
      {Key key, this.parameterImage, this.parameterTitle, this.parameter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image(
        image: parameterImage,
        color: droPurpleColor,
        height: 32,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleText(
            parameterTitle,
            color: greyColor,
            size: 12,
          ),
          SimpleText(
            parameter,
            color: blueColor.shade900,
            weight: FontWeight.bold,
          )
        ],
      )
    ]);
  }
}
