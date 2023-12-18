import 'package:gen/gen.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';
import 'package:moviemodular/product/state/base/base_cubit.dart';
import 'package:moviemodular/product/state/base/base_state.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';

/// Manage category view business logic
final class CategoryViewModel extends BaseCubit<BaseState<Genres>> {
  /// [MovieOperation] service
  CategoryViewModel({
    required MovieOperation operationService,
  })  : _movieOperationService = operationService,
        super(const BaseState.initial());

  final MovieOperation _movieOperationService;

  /// Fetch all categories
  Future<void> fetchAllCategories() async {
    emit(const BaseState<Genres>.loading());
    try {
      final response = await _movieOperationService.fetchAllCategories();
      emit(BaseState<Genres>.success(response!));
    } catch (_) {
      emit(BaseState<Genres>.error(LocaleKeys.categories_error.localize));
    }
  }
}
