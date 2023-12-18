import 'dart:io';

import 'package:dio/src/response.dart';
import 'package:moviemodular/product/service/manager/product_network_manager.dart';
import 'package:vexana/vexana.dart';

class ProductInterceptor extends InterceptorsWrapper {
  ProductInterceptor({required this.onErrorStatus});

  final OnErrorStatus onErrorStatus;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode ?? HttpStatus.notFound;

    onErrorStatus(statusCode);

    switch (statusCode) {
      case HttpStatus.unauthorized:
        _handleUnauthorizedError(err);
      // Add more cases as needed
    }

    return super.onError(err, handler);
  }

  void _handleUnauthorizedError(DioException err) {
    // Add your logic to handle unauthorized error
    // For example, navigate to the login page
  }
}
