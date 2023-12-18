import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/discover/view_model/discover_view_model.dart';
import 'package:moviemodular/product/state/base/base_state.dart';

import '../movie_service_mock.dart';

void main() {
  late final DiscoverViewModel discoverViewModel;

  final mockNowPlayingMoviesItem = Movie(
    page: 1,
    totalPages: 1,
    totalResults: 1,
    results: [MovieData(id: 1)],
  );

  setUp(() {
    discoverViewModel = DiscoverViewModel(operationService: MovieServiceMock());
  });

  group('DiscoverViewModel', () {
    test('initial state is BaseState<Movie>.initial', () {
      expect(
        discoverViewModel.state,
        equals(const BaseState<Movie>.initial()),
      );
    });

    blocTest<DiscoverViewModel, BaseState<Movie>>(
      'emits [BaseState<Movie>.loading, BaseState<Movie>.success] '
      'when now playing movies are loaded successfully',
      build: () => discoverViewModel,
      act: (viewModel) async => viewModel.fetchNowPlayingMovies(),
      expect: () => [
        const BaseState<Movie>.loading(),
        BaseState<Movie>.success(mockNowPlayingMoviesItem),
      ],
    );
  });
}
