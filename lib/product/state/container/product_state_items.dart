import 'package:flutter/foundation.dart' show immutable;
import 'package:moviemodular/product/service/manager/product_network_manager.dart';
import 'package:moviemodular/product/state/container/product_state_container.dart';
import 'package:moviemodular/product/state/view_model/product_view_model.dart';

@immutable
final class ProductStateItems {
  const ProductStateItems._();
  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
}
