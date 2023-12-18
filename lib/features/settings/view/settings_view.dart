import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemodular/product/init/localization/app_localization.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/state/container/product_state_items.dart';
import 'package:moviemodular/product/utility/enums/locale_enums.dart';
import 'package:moviemodular/product/utility/extensions/context_extensions.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:moviemodular/product/widget/text/localize_text.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const ProjectPadding.mediumVerticalAndHorizontal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const ProjectPadding.smallVertical(),
              child: LocalizeText(
                LocaleKeys.settings_title,
                textStyle: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () => LanguageBottomSheet.show(
                context,
                onTurkishTapped: () => ProductLocalization.updateLanguage(
                  context,
                  value: Locales.tr,
                ),
                onEnglishTapped: () async => ProductLocalization.updateLanguage(
                  context,
                  value: Locales.en,
                ),
              ),
              title: LocalizeText(LocaleKeys.settings_languageOptions),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            SwitchListTile.adaptive(
              title: LocalizeText(LocaleKeys.settings_darkMode),
              value: context.isDarkMode,
              onChanged: (_) =>
                  ProductStateItems.productViewModel.changeThemeMode(),
            ),
          ],
        ),
      ),
    );
  }
}
