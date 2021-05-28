import 'package:meta/meta.dart';

import '../../../base/data_base_classes/base_datasource.dart';
import '../../../utilities/constants/drug.dart';
import '../models/drug_card_model.dart';

abstract class SearchDatasource {
  Future<List<DrugCardModel>> searchForText({
    @required String searchQuery,
  });
}

class SearchDatasourceV1 with BaseDatasource implements SearchDatasource {
  @override
  Future<List<DrugCardModel>> searchForText({
    String searchQuery,
  }) async {
    final searchResults = <DrugCardModel>[];
    final flist = drugs; //drugs provides the list of progducts available;
    // ignore: omit_local_variable_types
    for (int i = 0; i < flist.length; i++) {
      final data = flist[i].drugName;
      if (data.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchResults.add(flist[i]);
      }
    }

    return searchResults;
  }
}
