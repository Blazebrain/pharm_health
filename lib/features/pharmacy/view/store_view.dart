import 'package:flutter/material.dart';

import '../../../app_routing/app_navigator.dart';
import '../../../base/view_base_classes/base_page_builder.dart';
import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../../../utilities/constants/bag.dart';
import '../models/drug_card_model.dart';
import '../view_models/pharmacy_view_model.dart';
import '../widgets/drug_card_widget.dart';
import '../widgets/helpers.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<PharmacyViewModel>(
      initState: (model) => model.getDrugs(),
      model: locator(),
      builder: (pharmacyViewModel, _) {
        return Scaffold(
          backgroundColor: textWhiteColor,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.arrow_back),
                          const Spacer(),
                          const Text('125 items(s)'),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: greyColor.withOpacity(0.2),
                            child: const Image(
                              image: sortIcon,
                              height: 24,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: greyColor.withOpacity(0.2),
                            child: const Image(
                              image: filterImage,
                              height: 20,
                              color: blackColor,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: greyColor.withOpacity(0.2),
                            child: IconButton(
                              onPressed: () {
                                AppNavigator.pushNamed(searchViewRoute);
                              },
                              icon: const Icon(
                                Icons.search,
                              ),
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GridView.extent(
                          childAspectRatio: 0.75,
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          children: [
                            for (DrugCardModel drug in pharmacyViewModel.drugs)
                              DrugCard(drugModel: drug)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () => AppNavigator.pushNamed(bagViewRoute),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        color: droPurpleColor,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => AppNavigator.pushNamed(bagViewRoute),
                            child: Container(
                              height: 4,
                              width: 40,
                              color: textWhiteColor,
                            ),
                          ),
                          Row(
                            children: [
                              bagIcon,
                              const SizedBox(width: 8),
                              const SimpleText(
                                'Bag',
                                color: textWhiteColor,
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: textWhiteColor,
                                child: SimpleText(
                                  bag.length.toString(),
                                  color: blackColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
