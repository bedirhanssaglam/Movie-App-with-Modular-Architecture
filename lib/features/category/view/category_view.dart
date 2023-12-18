import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/category/view/mixin/category_view_mixin.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/utility/extensions/context_extensions.dart';
import 'package:moviemodular/product/widget/bloc/base_bloc_widget.dart';
import 'package:moviemodular/product/widget/list_view/conditional_list_view.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:moviemodular/product/widget/text/localize_text.dart';

part 'widget/category_card.dart';

@RoutePage()
final class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

final class _CategoryViewState extends State<CategoryView>
    with CategoryViewMixin {
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
                LocaleKeys.categories_title,
                textStyle: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: BaseBlocWidget<Genres>(
                bloc: categoryViewModel,
                success: (Genres genres) => ConditionalListView<GenresData>(
                  item: genres.genres,
                  child: (index) => _CategoryCard(
                    categoryName: genres.genres![index].name ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
