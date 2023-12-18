part of '../details_view.dart';

final class _DetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _DetailsAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Assets.icons.svgAppLogo.toSvg(height: 50),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
