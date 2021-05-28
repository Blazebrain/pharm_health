import '../../../app_routing/app_navigator.dart';
import '../../../base/view_model_base_classes/base_view_model.dart';
import '../../../utilities/constants/bag.dart';
import '../data/bag_datasource.dart';
import '../models/bag_content_model.dart';

class BagViewModel extends BaseViewModel {
  final BagDatasource _dataSource;

  BagViewModel({BagDatasource dataSource}) : _dataSource = dataSource;
  int _quantity = 1;
  int get quantity => _quantity;
  void increase() {
    _quantity++;
    setState();
  }

  void decrease() {
    _quantity--;
    setState();
  }

  void delete(BagContentModel model) {
    bag.remove(model);
    setState();
    AppNavigator.pop();
  }

  final _bagContent = <BagContentModel>[];
  List<BagContentModel> get bagContent => List.from(_bagContent);
  Future<void> getBagContent() async {
    setState(viewState: ViewState.busy);
    final bagContent = await _dataSource.getBagContents();

    if (_bagContent.isNotEmpty) _bagContent.clear();

    _bagContent.addAll(bagContent);

    setState(viewState: ViewState.done);
  }

  Future<bool> addToBag(image, name, price, type) {
    final _bags = bag;

    final newBag = BagContentModel(
      quantity: quantity,
      drugImage: image,
      drugName: name,
      drugPrice: price,
      drugType: type,
    );
    _bags.add(newBag);
    setState();
    return Future.value(true);
  }
}
