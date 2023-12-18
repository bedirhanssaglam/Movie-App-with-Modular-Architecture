import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/category/view_model/category_view_model.dart';
import 'package:moviemodular/product/state/base/base_state.dart';

import 'category_service_mock.dart';

void main() {
  late final CategoryViewModel categoryViewModel;

  final mockGenresItem = Genres(
    genres: [
      GenresData(id: 1, name: 'Action'),
      GenresData(id: 2, name: 'Comedy'),
    ],
  );

  setUp(() {
    categoryViewModel =
        CategoryViewModel(operationService: CategoryServiceMock());
  });

  group('CategoryViewModel', () {
    test('initial state is BaseState<Genres>.initial', () {
      expect(
        categoryViewModel.state,
        equals(const BaseState<Genres>.initial()),
      );
    });

    blocTest<CategoryViewModel, BaseState<Genres>>(
      'emits [BaseState<Genres>.loading, BaseState<Genres>.success] '
      'when categories are loaded successfully',
      build: () => categoryViewModel,
      act: (viewModel) async => viewModel.fetchAllCategories(),
      expect: () => [
        const BaseState<Genres>.loading(),
        BaseState<Genres>.success(mockGenresItem),
      ],
    );
  });
}
