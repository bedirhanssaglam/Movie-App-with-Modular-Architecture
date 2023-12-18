part of 'base_bloc_widget.dart';

final class _StateWidgetBuilder<T extends Object> extends StatelessWidget {
  const _StateWidgetBuilder({
    required this.state,
    required this.success,
    super.key,
  });

  final BaseState<T> state;
  final SuccessBuilder<T> success;

  @override
  Widget build(BuildContext context) {
    return state.when<Widget>(
      success: success!,
      error: (message) => Center(child: Text(message)),
      initial: SizedBox.shrink,
      loading: () => Center(
        child: Center(
          child: Assets.lottie.loading.lottieBuilder(),
        ),
      ),
    );
  }
}
