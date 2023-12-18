import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/details/view/mixin/details_view_mixin.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/utility/extensions/asset_extensions.dart';
import 'package:moviemodular/product/utility/extensions/context_extensions.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';
import 'package:moviemodular/product/widget/bloc/base_bloc_widget.dart';
import 'package:moviemodular/product/widget/image/project_cached_image.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:moviemodular/product/widget/text/localize_text.dart';

part 'widget/details_appbar.dart';
part 'widget/movie_overview_row.dart';

@RoutePage()
final class DetailsView extends StatefulWidget {
  const DetailsView({required this.movieId, super.key});

  final int movieId;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> with DetailsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _DetailsAppBar(),
      body: SingleChildScrollView(
        child: BaseBlocWidget<MovieData>(
          bloc: detailsViewModel,
          success: (movieData) => Padding(
            padding: const ProjectPadding.mediumVerticalAndHorizontal(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProjectCachedImage(
                    url: movieData.backdropPath.toMovieImage,
                  ),
                ),
                30.verticalSpace,
                Text(
                  movieData.title ?? '',
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                12.verticalSpace,
                Text(movieData.overview ?? ''),
                20.verticalSpace,
                _MovieOverviewRow(
                  firstText: LocaleKeys.details_popularity,
                  secondText: movieData.popularity.toString(),
                ),
                _MovieOverviewRow(
                  firstText: LocaleKeys.details_status,
                  secondText: movieData.status,
                ),
                _MovieOverviewRow(
                  firstText: LocaleKeys.details_voteCount,
                  secondText: movieData.voteCount.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
