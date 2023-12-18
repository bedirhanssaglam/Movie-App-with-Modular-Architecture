part of '../base_bloc_widget.dart';

base mixin _BaseBlocWidgetMixin<T extends Object> on StatelessWidget {
  void _assertions(
    BlocType blocType,
    SuccessBuilder<T>? success,
    Widget? listenerChild,
    ListenerFunction<T>? listener,
  ) {
    assert(
      (blocType != BlocType.listener || listenerChild == null) ||
          success == null,
      _AssertErrorMessages.unneccesarryUseOfSuccess,
    );
    assert(
      (blocType != BlocType.listener || listenerChild != null) ||
          success != null,
      _AssertErrorMessages.successMustBeProvidedWithoutListenerChild,
    );
    assert(
      blocType != BlocType.listener || listener != null,
      _AssertErrorMessages.listenerMustBeProvided,
    );
    assert(
      blocType != BlocType.builder || listener == null,
      _AssertErrorMessages.unneccesarryUseOfListener,
    );
    assert(
      blocType != BlocType.builder || success != null,
      _AssertErrorMessages.successMustBeProvidedForBuilder,
    );
  }
}

@immutable
abstract final class _AssertErrorMessages {
  const _AssertErrorMessages._();

  static const String successMustBeProvidedForBuilder =
      'success must be provided when type is BlocType.builder';
  static const String successMustBeProvidedWithoutListenerChild =
      'success must be provided when type is BlocType.listener and listenerChild is null';
  static const String unneccesarryUseOfSuccess =
      "Unnecessary use of 'success', because listenerChild is not null";
  static const String unneccesarryUseOfListener =
      "Unnecessary use of 'listener', because type is BlocType.builder";
  static const String listenerMustBeProvided =
      'listener must be provided when type is BlocType.listener';
}
