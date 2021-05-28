import '../../../base/data_base_classes/base_datasource.dart';
import '../../../utilities/constants/bag.dart';
import '../models/bag_content_model.dart';

abstract class BagDatasource {
  Future<List<BagContentModel>> getBagContents();
}

class BagDatasourceV1 with BaseDatasource implements BagDatasource {
  @override
  Future<List<BagContentModel>> getBagContents() async {
    return bag;
  }
}
