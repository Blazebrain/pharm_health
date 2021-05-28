import '../../../base/data_base_classes/base_datasource.dart';
import '../../../utilities/constants/drug.dart';
import '../models/drug_card_model.dart';

abstract class PharmacyDatasource {
  Future<List<DrugCardModel>> getDrugs();
}

class PharmacyDatasourceV1 with BaseDatasource implements PharmacyDatasource {
  @override
  Future<List<DrugCardModel>> getDrugs() async {
    return drugs;
  }
}
