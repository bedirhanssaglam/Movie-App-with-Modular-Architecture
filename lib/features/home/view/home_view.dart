import 'package:auto_route/auto_route.dart' show AutoRouterX, RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/home/view/mixin/home_view_mixin.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/routes/app_router.dart';
import 'package:moviemodular/product/utility/app_border_radius.dart';
import 'package:moviemodular/product/utility/extensions/context_extensions.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';
import 'package:moviemodular/product/widget/bloc/base_bloc_widget.dart';
import 'package:moviemodular/product/widget/carousel_slider/project_carousel_slider.dart';
import 'package:moviemodular/product/widget/image/project_cached_image.dart';
import 'package:moviemodular/product/widget/list_view/conditional_list_view.dart';
import 'package:moviemodular/product/widget/padding/app_padding.dart';
import 'package:moviemodular/product/widget/text/localize_text.dart';
import 'package:widgets/widgets.dart';

part 'widget/carousel_slider_item_widget.dart';
part 'widget/home_appbar.dart';
part 'widget/top_rated_movie_data.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: BaseBlocWidget<Movie>(
        bloc: homeViewModel,
        success: (Movie movie) => Column(
          children: [
            ProjectCarouselSlider(
              itemCount: movie.results?.length ?? 0,
              widgetBuilder: (index) => _CarouselSliderItemWidget(
                movieData: movie.results?[index],
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: const ProjectPadding.normalHorizontal(),
              child: LocalizeText(
                LocaleKeys.home_topRatedMovies,
                textStyle: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            20.verticalSpace,
            Expanded(
              flex: 2,
              child: ConditionalListView<MovieData>(
                item: movie.results,
                padding: const ProjectPadding.normalHorizontal(),
                child: (index) => _TopRatedMovieCard(
                  movieData: movie.results?[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
