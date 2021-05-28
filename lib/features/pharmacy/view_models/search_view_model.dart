import 'package:flutter/cupertino.dart';

import '../../../base/view_model_base_classes/base_view_model.dart';
import '../data/search_datasource.dart';
import '../models/drug_card_model.dart';

class SearchViewModel extends BaseViewModel {
  final searchField = TextEditingController();
  final SearchDatasource datasource;

  SearchViewModel({
    @required this.datasource,
  });

  @override
  void initialize() {}

  final List<DrugCardModel> _searchResults = [];
  List<DrugCardModel> get searchResults => _searchResults;

  void onChanged() {
    setState(viewState: ViewState.busy);
    _search();
  }

  Future<void> _search() async {
    if (searchField.text.isEmpty) {
      _searchResults.clear();
      setState(viewState: ViewState.none);
      return;
    }

    final results = await datasource.searchForText(
      searchQuery: searchField.text,
    );

    _searchResults.addAll(results);
    setState(viewState: ViewState.done);
  }

  bool get isEditingText => searchField.text.isNotEmpty; //&& isNotSearching

}
