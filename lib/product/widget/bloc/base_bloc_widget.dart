import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/product/state/base/base_state.dart';
import 'package:moviemodular/product/utility/extensions/asset_extensions.dart';

part 'mixin/base_bloc_widget_mixin.dart';
part 'state_widget_builder.dart';

typedef SuccessBuilder<T extends Object> = Widget Function(T)?;

typedef ListenerFunction<T extends Object> = void Function(
  BuildContext,
  BaseState<T>,
)?;

typedef ListenWhenFunction<T extends Object> = bool Function(
  BaseState<T>,
  BaseState<T>,
)?;

enum BlocType { builder, listener }

final class BaseBlocWidget<T extends Object> extends StatelessWidget
    with _BaseBlocWidgetMixin<T> {
  BaseBlocWidget({
    required this.bloc,
    super.key,
    this.success,
    this.blocType = BlocType.builder,
    this.listener,
    this.listenerChild,
    this.listenWhen,
  }) {
    _assertions(blocType, success, listenerChild, listener);
  }

  final SuccessBuilder<T> success;
  final BlocType blocType;
  final Widget? listenerChild;
  final ListenerFunction listener;
  final StateStreamable<BaseState<T>> bloc;
  final ListenWhenFunction listenWhen;

  @override
  Widget build(BuildContext context) {
    switch (blocType) {
      case BlocType.listener:
        return BlocListener<StateStreamable<BaseState<T>>, BaseState<T>>(
          bloc: bloc,
          listener: listener!,
          listenWhen: listenWhen,
          child: listenerChild ?? _buildBlocBuilder(context),
        );
      case BlocType.builder:
        return _buildBlocBuilder(context);
    }
  }

  Widget _buildBlocBuilder(BuildContext context) {
    return BlocBuilder<StateStreamable<BaseState<T>>, BaseState<T>>(
      bloc: bloc,
      builder: (context, state) {
        return _StateWidgetBuilder(
          state: state,
          success: success,
        );
      },
    );
  }
}
