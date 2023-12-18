import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@Freezed()
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial;
  const factory BaseState.loading() = _Loading;
  const factory BaseState.success(T data) = _Success<T>;
  const factory BaseState.error(String message) = _Error;
}
