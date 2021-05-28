import 'package:flutter/material.dart';

import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../models/bag_content_model.dart';

class BagContentListTile extends StatelessWidget {
  final BagContentModel bagContentModel;

  const BagContentListTile({Key key, this.bagContentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: Colors.transparent,
      // height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: bagContentModel.drugImage,
                backgroundColor: textWhiteColor,
              ),
              const SizedBox(width: 12),
              SimpleText(
                '${bagContentModel.quantity.toString()}X',
                color: textWhiteColor,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleText(
                    bagContentModel.drugName,
                    color: textWhiteColor,
                    weight: FontWeight.bold,
                  ),
                  SimpleText(
                    bagContentModel.drugType,
                    color: textWhiteColor,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          // const Spacer(),
          SimpleText(
            'N${bagContentModel.drugPrice.toString()}',
            color: textWhiteColor,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
