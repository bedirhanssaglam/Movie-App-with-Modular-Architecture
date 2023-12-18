import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/home/view_model/home_view_model.dart';
import 'package:moviemodular/product/state/base/base_state.dart';

import '../movie_service_mock.dart';

void main() {
  late final HomeViewModel homeViewModel;

  final mockTopRatedMoviesItem = Movie(
    page: 1,
    totalPages: 1,
    totalResults: 1,
    results: [MovieData(id: 1)],
  );

  setUp(() {
    homeViewModel = HomeViewModel(operationService: MovieServiceMock());
  });

  group('HomeViewModel', () {
    test('initial state is BaseState<Movie>.initial', () {
      expect(
        homeViewModel.state,
        equals(const BaseState<Movie>.initial()),
      );
    });

    blocTest<HomeViewModel, BaseState<Movie>>(
      'emits [BaseState<Movie>.loading, BaseState<Movie>.success] '
      'when top rated movies are loaded successfully',
      build: () => homeViewModel,
      act: (viewModel) async => viewModel.fetchTopRatedMovies(),
      expect: () => [
        const BaseState<Movie>.loading(),
        BaseState<Movie>.success(mockTopRatedMoviesItem),
      ],
    );
  });
}
