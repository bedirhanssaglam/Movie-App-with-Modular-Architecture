import 'package:flutter/material.dart';
import 'package:moviemodular/features/discover/view/discover_view.dart';
import 'package:moviemodular/features/discover/view_model/discover_view_model.dart';
import 'package:moviemodular/product/service/movie_service.dart';
import 'package:moviemodular/product/state/container/product_state_items.dart';

/// Manage discover view business logic
mixin DiscoverViewMixin on State<DiscoverView> {
  late final DiscoverViewModel _discoverViewModel;

  DiscoverViewModel get discoverViewModel => _discoverViewModel;

  @override
  void initState() {
    super.initState();
    _discoverViewModel = DiscoverViewModel(
      operationService: MovieService(ProductStateItems.productNetworkManager),
    )..fetchNowPlayingMovies();
  }
}
