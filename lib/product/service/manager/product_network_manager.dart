import 'package:flutter/foundation.dart' show ValueChanged;
import 'package:moviemodular/product/init/config/app_environment.dart';
import 'package:moviemodular/product/service/interceptor/product_interceptor.dart';
import 'package:vexana/vexana.dart';

typedef OnErrorStatus = ValueChanged<int>;

/// Product network manager
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            queryParameters: {
              'api_key': AppEnvironmentItems.apiKey.value,
            },
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required OnErrorStatus onErrorStatus}) {
    interceptors.add(
      ProductInterceptor(onErrorStatus: onErrorStatus),
    );
  }
}
