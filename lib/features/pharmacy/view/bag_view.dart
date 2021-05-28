import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../app_routing/app_navigator.dart';
import '../../../base/view_base_classes/base_page_builder.dart';
import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../../../utilities/constants/bag.dart';
import '../view_models/bag_view_model.dart';
import '../widgets/bag_content_list_tile.dart';
import '../widgets/helpers.dart';

class BagView extends StatefulWidget {
  @override
  _BagViewState createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  final bagKeyList = [];

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<BagViewModel>(
      initState: (model) => model.getBagContent(),
      model: locator(),
      builder: (bagViewModel, _) => Scaffold(
        backgroundColor: droPurpleColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const Image(
                          image: bagIconBlack,
                          height: 24,
                          color: textWhiteColor,
                        ),
                        const SizedBox(width: 8),
                        const SimpleText('Bag', color: textWhiteColor),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: textWhiteColor,
                      child: SimpleText(
                        bag.length.toString(),
                        color: blackColor,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: textWhiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const SimpleText(
                    'Tap on an item for add, delete, remove options',
                    weight: FontWeight.bold,
                    size: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                      itemCount: bagViewModel.bagContent.length,
                      itemBuilder: (context, index) {
                        bagKeyList.add(GlobalKey(debugLabel: 'index :$index'));
                        return ExpansionTileCard(
                          baseColor: Colors.transparent,
                          expandedColor: Colors.transparent,
                          elevation: 0.0,
                          key: bagKeyList[index],
                          onExpansionChanged: (value) {
                            if (value) {
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                for (var i = 0; i < bagKeyList.length; i++) {
                                  if (index != i) {
                                    bagKeyList[i].currentState?.collapse();
                                  }
                                }
                              });
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          finalPadding: EdgeInsets.zero,
                          trailing: const SizedBox.shrink(),
                          title: Dismissible(
                            key: bagKeyList[index],
                            onDismissed: (direction) {
                              AppNavigator.pop();
                            },
                            child: BagContentListTile(
                              bagContentModel: bagViewModel.bagContent[index],
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: textWhiteColor,
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    bagViewModel.delete(
                                      bagViewModel.bagContent[index],
                                    );
                                    setState(() {});
                                  },
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        color: textWhiteColor,
                                      ),
                                      onPressed: () => bagViewModel.decrease(),
                                    ),
                                    SimpleText(
                                      '${bagViewModel.quantity.toString()}',
                                      color: textWhiteColor,
                                      weight: FontWeight.bold,
                                      size: 20,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: textWhiteColor,
                                      ),
                                      onPressed: () => bagViewModel.increase(),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      }),
                )
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
