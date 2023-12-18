import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/details/view_model/details_view_model.dart';
import 'package:moviemodular/product/state/base/base_state.dart';

import '../movie_service_mock.dart';

void main() {
  late final DetailsViewModel detailsViewModel;

  final mockNowPlayingMoviesItem = MovieData(id: 1);

  setUp(() {
    detailsViewModel = DetailsViewModel(operationService: MovieServiceMock());
  });

  group('DetailsViewModel', () {
    test('initial state is BaseState<MovieData>.initial', () {
      expect(
        detailsViewModel.state,
        equals(const BaseState<MovieData>.initial()),
      );
    });

    blocTest<DetailsViewModel, BaseState<MovieData>>(
      'emits [BaseState<MovieData>.loading, BaseState<MovieData>.success] '
      'when movie details are loaded successfully',
      build: () => detailsViewModel,
      act: (viewModel) async => viewModel.fetchMovieDetails(1),
      expect: () => [
        const BaseState<MovieData>.loading(),
        BaseState<MovieData>.success(mockNowPlayingMoviesItem),
      ],
    );
  });
}
