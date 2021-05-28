import 'package:flutter/material.dart';

import '../../../app_routing/app_navigator.dart';
import '../../../base/view_base_classes/base_page_builder.dart';
import '../../../base/view_base_classes/style/style.dart';
import '../../../base/view_base_classes/widgets/simple_text.dart';
import '../models/drug_card_model.dart';
import '../view_models/search_view_model.dart';
import '../widgets/drug_card_widget.dart';
import '../widgets/helpers.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<SearchViewModel>(
      model: locator(),
      builder: (searchModel, _) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 128),
          child: Container(
            decoration: const BoxDecoration(
              color: textWhiteColor,
            ),
            padding: const EdgeInsets.only(
              top: 32,
              // bottom: 24,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => AppNavigator.pop(),
                    ),
                    const Spacer(),
                    const SimpleText('125 items(s)'),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Spacer(),
                    CircleAvatar(
                        backgroundColor: greyColor.withOpacity(0.2),
                        child: const Image(
                          image: sortIcon,
                          height: 24,
                        )),
                    // Spacer(),
                    CircleAvatar(
                      backgroundColor: greyColor.withOpacity(0.2),
                      child: const Image(
                        image: filterImage,
                        height: 20,
                        color: blackColor,
                      ),
                    ),
                    // Spacer(),
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
                    // Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TextField(
                    controller: searchModel.searchField,
                    onChanged: (_) => searchModel.onChanged(),
                    decoration: inputFieldDecoration.copyWith(
                      hintText: 'Search for drugs by name...',
                      fillColor: textWhiteColor,
                      focusColor: textWhiteColor,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Icon(Icons.search),
                      ),
                      suffixIconConstraints: const BoxConstraints.tightFor(
                        height: 32,
                        width: 32,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          child: const Image(image: cancelImage),
                          onTap: () {
                            searchModel.searchField.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: searchModel.isEditingText
              ? StateBasedWidget(
                  state: searchModel.viewState,
                  retryCallback: searchModel.onChanged,
                  errorWidget: Container(
                      decoration: const BoxDecoration(
                        color: textWhiteColor,
                      ),
                      alignment: const Alignment(0, -0.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/no_result_image.png',
                            height: 120,
                            // width: 200,
                          ),
                          const SizedBox(height: 32),
                          const SimpleText(
                            'Oops, so sorry!',
                            weight: FontWeight.w700,
                            size: 20,
                            color: droPurpleColor,
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "We couldn't find any result for ",
                              style: const TextStyle(
                                fontFamily: 'ProximaNova',
                                color: droPurpleColor,
                                fontSize: 16,
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(
                                  text: '${searchModel.searchField.text}. \n',
                                  style:const  TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: droPurpleColor,
                                  ),
                                ),
                                const TextSpan(text: 'Try a new word'),
                              ],
                            ),
                          ),
                        ],
                      )),
                  successWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: searchModel.searchResults.isEmpty
                            ? const SizedBox.shrink()
                            : GridView.extent(
                                childAspectRatio: 0.75,
                                maxCrossAxisExtent: 300,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(12),
                                children: [
                                  for (DrugCardModel drug
                                      in searchModel.searchResults)
                                    DrugCard(
                                      drugModel: drug,
                                    ),
                                ],
                              ),
                      ),
                    ],
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    color: textWhiteColor,
                  ),
                  alignment: const Alignment(0, -0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/start_search_image.png',
                          height: 120,
                          // width: 200,
                        ),
                        const SizedBox(height: 32),
                        const SimpleText(
                          'What drug are\n you searching for here?',
                          weight: FontWeight.w700,
                          size: 20,
                          height: 1.4,
                          color: droPurpleColor,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        SimpleText(
                          'Search for your drugs or find '
                          'similar result in this area.',
                          textAlign: TextAlign.center,
                          color: droPurpleColor.withOpacity(0.8),
                          size: 16,
                          height: 1.4,
                        )
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
