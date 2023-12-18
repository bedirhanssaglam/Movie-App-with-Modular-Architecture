import 'package:gen/gen.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';
import 'package:moviemodular/product/state/base/base_cubit.dart';
import 'package:moviemodular/product/state/base/base_state.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';

/// Manage details view business logic
final class DetailsViewModel extends BaseCubit<BaseState<MovieData>> {
  /// [MovieOperation] service
  DetailsViewModel({
    required MovieOperation operationService,
  })  : _movieOperationService = operationService,
        super(const BaseState.initial());

  final MovieOperation _movieOperationService;

  /// Fetch movie details
  Future<void> fetchMovieDetails(int movieId) async {
    emit(const BaseState<MovieData>.loading());
    try {
      final response = await _movieOperationService.fetchMovieDetails(movieId);
      emit(BaseState<MovieData>.success(response!));
    } catch (_) {
      emit(BaseState<MovieData>.error(LocaleKeys.details_error.localize));
    }
  }
}
