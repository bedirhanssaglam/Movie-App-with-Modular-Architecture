import 'package:flutter/material.dart';
import 'package:moviemodular/features/category/view/category_view.dart';
import 'package:moviemodular/features/category/view_model/category_view_model.dart';
import 'package:moviemodular/product/service/movie_service.dart';
import 'package:moviemodular/product/state/container/product_state_items.dart';

/// Manage category view business logic
base mixin CategoryViewMixin on State<CategoryView> {
  late final CategoryViewModel _categoryViewModel;

  CategoryViewModel get categoryViewModel => _categoryViewModel;

  @override
  void initState() {
    super.initState();
    _categoryViewModel = CategoryViewModel(
      operationService: MovieService(ProductStateItems.productNetworkManager),
    )..fetchAllCategories();
  }
}
