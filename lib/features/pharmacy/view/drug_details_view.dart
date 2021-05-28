import 'package:flutter/material.dart';

import '../../../app_routing/app_navigator.dart';
import '../../../base/view_base_classes/base_page_builder.dart';
import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../models/drug_card_model.dart';
import '../view_models/bag_view_model.dart';
import '../widgets/further_info_widget.dart';
import '../widgets/helpers.dart';
import '../widgets/long_button.dart';
import 'bag_view.dart';

class DrugDetails extends StatelessWidget {
  final DrugCardModel model;

  const DrugDetails({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<BagViewModel>(
      model: locator(),
      builder: (bagViewModel, _) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => AppNavigator.pop(),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => AppNavigator.pushNamed(bagViewRoute),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: droPurpleColor,
                          ),
                          child: Row(
                            children: [
                              bagIcon,
                              const SizedBox(width: 4),
                              const SimpleText('3', color: textWhiteColor),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      child: Image(
                        image: model.drugImage,
                        width: 80,
                        height: 160,
                      ),
                    ),
                  ),
                  SimpleText(model.drugName, weight: FontWeight.bold),
                  SimpleText(
                    '${model.drugConstituent} - 650mg',
                    size: 14,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: greyColor,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SimpleText(
                            'SOLD BY',
                            size: 14,
                            color: greyColor,
                          ),
                          SimpleText(
                            model.companyName,
                            size: 14,
                            color: blueColor.shade900,
                            weight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: blackColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => bagViewModel.decrease(),
                            ),
                            SimpleText(
                              '${bagViewModel.quantity.toString()}',
                              color: blackColor,
                              weight: FontWeight.bold,
                              size: 20,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => bagViewModel.increase(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SimpleText('₦'),
                          SimpleText(
                            model.drugPrice.toString(),
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  const SimpleText('PRODUCT DETAILS'),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      FurtherInfoWidget(
                        parameterImage: bagIconBlack,
                        parameterTitle: 'PACK SIZE',
                        parameter: model.packSize,
                      ),
                      const Spacer(),
                      FurtherInfoWidget(
                        parameterImage: bagIconBlack,
                        parameterTitle: 'PACK SIZE',
                        parameter: model.packSize,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FurtherInfoWidget(
                    parameterImage: bagIconBlack,
                    parameterTitle: 'CONSTITUENTS',
                    parameter: model.drugConstituent,
                  ),
                  const SizedBox(height: 16),
                  FurtherInfoWidget(
                    parameterImage: bagIconBlack,
                    parameterTitle: 'DISPENSED BY',
                    parameter: model.dispenseMethod,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: SimpleText(
                      '''1 pack of ${model.drugConstituent} contains 3 '''
                      '''units(s) of 10 tablet(s)''',
                      size: 12,
                    ),
                  ),
                  const SizedBox(height: 60),
                  LongButton.purple(
                    onPressed: () async {
                      await bagViewModel.addToBag(
                        model.drugImage,
                        model.drugName,
                        model.drugPrice,
                        model.drugType,
                      );
                      buildShowDialogForAddToCart(context);
                    },
                    label: 'Add to bag',
                    borderRadius: 16,
                    icon: bagIconBlack,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowDialogForAddToCart(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: textWhiteColor,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          content: Container(
            height: 220,
            child: Column(
              children: [
                const Center(
                  child: SimpleText(
                    'Successful',
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SimpleText(
                  '''${model.drugName} has been added to'''
                  ''' your bag''',
                  textAlign: TextAlign.center,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                LongButton(
                  onPressed: () {
                    AppNavigator.push(BagView());
                  },
                  label: 'View Bag',
                  borderRadius: 0,
                  fillColor: droTurquoiseColor,
                ),
                const SizedBox(height: 16),
                LongButton(
                  onPressed: () {
                    AppNavigator.pop();
                  },
                  label: 'Done',
                  borderRadius: 0,
                  fillColor: droTurquoiseColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
