import 'package:flutter/material.dart';
import 'package:moviemodular/features/details/view/details_view.dart';
import 'package:moviemodular/features/details/view_model/details_view_model.dart';
import 'package:moviemodular/product/service/movie_service.dart';
import 'package:moviemodular/product/state/container/product_state_items.dart';

/// Manage details view business logic
mixin DetailsViewMixin on State<DetailsView> {
  late final int _movieId;
  late final DetailsViewModel _detailsViewModel;

  DetailsViewModel get detailsViewModel => _detailsViewModel;

  @override
  void initState() {
    super.initState();
    _movieId = widget.movieId;
    _detailsViewModel = DetailsViewModel(
      operationService: MovieService(ProductStateItems.productNetworkManager),
    )..fetchMovieDetails(_movieId);
  }
}
