import '../../../base/view_model_base_classes/base_view_model.dart';
import '../data/pharmacy_datasource.dart';
import '../models/drug_card_model.dart';

class PharmacyViewModel extends BaseViewModel {
  final PharmacyDatasource _dataSource;

  PharmacyViewModel({PharmacyDatasource dataSource}) : _dataSource = dataSource;

  final _drugs = <DrugCardModel>[];
  List<DrugCardModel> get drugs => List.from(_drugs);
  Future<void> getDrugs() async {
    setState(viewState: ViewState.busy);
    final drug = await _dataSource.getDrugs();

    if (_drugs.isNotEmpty) _drugs.clear();

    _drugs.addAll(drug);

    setState(viewState: ViewState.done);
  }

  // sort() {
  //   someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));
  // }
}
