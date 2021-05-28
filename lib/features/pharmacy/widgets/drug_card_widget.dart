import 'package:flutter/material.dart';

import '../../../app_routing/app_navigator.dart';
import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../models/drug_card_model.dart';
import '../view/drug_details_view.dart';

class DrugCard extends StatelessWidget {
  final DrugCardModel drugModel;

  const DrugCard({Key key, this.drugModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(DrugDetails(model: drugModel));
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        elevation: 8,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  child: Image(
                    image: drugModel.drugImage,
                    width: 80,
                    height: 132,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              SimpleText(
                drugModel.drugName,
                size: 16,
                weight: FontWeight.bold,
              ),
              SimpleText(
                drugModel.drugConstituent,
                size: 14,
              ),
              SimpleText(
                drugModel.drugType,
                size: 12,
              ),
              // const SizedBox(height: 4),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: greyColor,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    child: SimpleText(
                      '₦${drugModel.drugPrice.toString()}',
                      color: textWhiteColor,
                      size: 12,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
