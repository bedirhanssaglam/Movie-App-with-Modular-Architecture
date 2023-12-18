part of '../home_view.dart';

final class _CarouselSliderItemWidget extends StatelessWidget {
  const _CarouselSliderItemWidget({
    required this.movieData,
  });

  final MovieData? movieData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushRoute(
        DetailsRoute(movieId: movieData!.id!),
      ),
      child: Card(
        child: ClipRRect(
          borderRadius: AppBorderRadius.circularMedium(),
          child: ProjectCachedImage(
            url: movieData?.backdropPath?.toMovieImage,
          ),
        ),
      ),
    );
  }
}
