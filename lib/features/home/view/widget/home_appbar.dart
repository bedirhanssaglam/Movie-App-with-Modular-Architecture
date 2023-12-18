part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocalizeText(
            LocaleKeys.home_appbar_title,
            textStyle: context.textTheme.bodyLarge,
          ),
          LocalizeText(
            LocaleKeys.home_appbar_subtitle,
            textStyle: context.textTheme.bodySmall,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => InfoDialog.show(
            context,
            title: LocaleKeys.home_appbar_dialog_title.localize,
            content: LocaleKeys.home_appbar_dialog_subtitle.localize,
          ),
          icon: const Icon(Icons.info_outline),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
