import 'package:get_it/get_it.dart';
import 'package:moviemodular/product/service/manager/product_network_manager.dart';
import 'package:moviemodular/product/state/view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final GetIt _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new)
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base());
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
