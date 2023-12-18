import 'package:gen/gen.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';
import 'package:moviemodular/product/state/base/base_cubit.dart';
import 'package:moviemodular/product/state/base/base_state.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';

/// Manage home view business logic
final class HomeViewModel extends BaseCubit<BaseState<Movie>> {
  /// [MovieOperation] service
  HomeViewModel({
    required MovieOperation operationService,
  })  : _movieOperationService = operationService,
        super(const BaseState.initial());

  final MovieOperation _movieOperationService;

  /// Fetch top rated movies
  Future<void> fetchTopRatedMovies() async {
    emit(const BaseState<Movie>.loading());
    try {
      final response = await _movieOperationService.fetchTopRatedMovies();
      emit(BaseState<Movie>.success(response!));
    } catch (_) {
      emit(BaseState<Movie>.error(LocaleKeys.home_error.localize));
    }
  }
}
