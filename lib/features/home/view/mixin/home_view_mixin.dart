import 'package:flutter/material.dart';
import 'package:moviemodular/features/home/view/home_view.dart';
import 'package:moviemodular/features/home/view_model/home_view_model.dart';
import 'package:moviemodular/product/service/movie_service.dart';
import 'package:moviemodular/product/state/container/product_state_items.dart';

/// Manage home view business logic
base mixin HomeViewMixin on State<HomeView> {
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(
      operationService: MovieService(ProductStateItems.productNetworkManager),
    )..fetchTopRatedMovies();
  }
}
