import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/pharmacy/data/bag_datasource.dart';
import 'features/pharmacy/data/pharmacy_datasource.dart';
import 'features/pharmacy/data/search_datasource.dart';
import 'features/pharmacy/view_models/bag_view_model.dart';
import 'features/pharmacy/view_models/pharmacy_view_model.dart';
import 'features/pharmacy/view_models/search_view_model.dart';
import 'services/local_storage_service.dart';

// import 'package:location/location.dart' as location;
final locator = GetIt.instance;

class AppDependencies {
  AppDependencies._();
  static AppDependencies locate = AppDependencies._();

  Future<void> reset() async {
    await locator.reset();
    await register();
  }

  Future<void> register() async {
    _registerServices();
    await _registerExternalDependencies();
    _pharmacyDependencies();
    _bagDependencies();
    _searchDependencies();
  }

  /// __________________________________________________________________________
  /// Register single instances for abstraction of
  /// **storage**, **payments**
  void _registerServices() async {
    locator.registerLazySingleton<LocalStorageService>(
      () => SharedPreferenceLocalStorage(
        sharedPreferences: locator(),
      ),
    );
  }

  /// __________________________________________________________________________
  Future<void> _registerExternalDependencies() async {
    final instance = await SharedPreferences.getInstance();
    locator.registerLazySingleton<SharedPreferences>(() => instance);
  }

  void _pharmacyDependencies() {
    locator.registerLazySingleton(
      () => PharmacyViewModel(dataSource: locator()),
    );

    locator.registerFactory<PharmacyDatasource>(() => PharmacyDatasourceV1());
  }

  void _bagDependencies() {
    locator.registerLazySingleton(
      () => BagViewModel(dataSource: locator()),
    );

    locator.registerFactory<BagDatasource>(() => BagDatasourceV1());
  }

  void _searchDependencies() {
    locator.registerLazySingleton(
      () => SearchViewModel(datasource: locator()),
    );

    locator.registerFactory<SearchDatasource>(() => SearchDatasourceV1());
  }
}
