import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/utility/extensions/asset_extensions.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:moviemodular/product/widget/text/localize_text.dart';

final class ConditionalListView<T extends Object> extends StatelessWidget {
  const ConditionalListView({
    required this.child,
    required this.item,
    super.key,
    this.padding,
  });

  final List<T>? item;
  final Widget Function(int index) child;
  final ProjectPadding? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: item != null
          ? (item?.isNotEmpty ?? false)
              ? ListView.builder(
                  itemCount: item!.length,
                  padding: padding,
                  itemBuilder: (context, index) => child(index),
                )
              : const _EmptyDataWidget()
          : const _NullDataWidget(),
    );
  }
}

final class _EmptyDataWidget extends StatelessWidget {
  const _EmptyDataWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.svgEmptyBox.toSvg(),
        LocalizeText(LocaleKeys.emptyData),
      ],
    );
  }
}

final class _NullDataWidget extends StatelessWidget {
  const _NullDataWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.svgNullList.toSvg(),
        20.verticalSpace,
        LocalizeText(LocaleKeys.nullData),
      ],
    );
  }
}
