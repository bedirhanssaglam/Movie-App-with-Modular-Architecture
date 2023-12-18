import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/discover/view/mixin/discover_view_mixin.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/routes/app_router.dart';
import 'package:moviemodular/product/utility/extensions/context_extensions.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';
import 'package:moviemodular/product/widget/bloc/base_bloc_widget.dart';
import 'package:moviemodular/product/widget/list_view/conditional_list_view.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:widgets/widgets.dart';

part 'widget/movie_list_tile.dart';

@RoutePage()
final class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> with DiscoverViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const ProjectPadding.mediumVerticalAndHorizontal(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.discover_title.localize,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => InfoDialog.show(
                    context,
                    title: LocaleKeys.discover_title.localize,
                    content: LocaleKeys.discover_dialog_subtitle.localize,
                  ),
                  icon: const Icon(Icons.info_outline),
                ),
              ],
            ),
            Expanded(
              child: BaseBlocWidget<Movie>(
                bloc: discoverViewModel,
                success: (movie) => ConditionalListView<MovieData>(
                  item: movie.results,
                  child: (index) => _MovieListTile(
                    movieData: movie.results![index],
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
