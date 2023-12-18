part of '../home_view.dart';

final class _TopRatedMovieCard extends StatelessWidget {
  const _TopRatedMovieCard({required this.movieData});

  final MovieData? movieData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.pushRoute(
          DetailsRoute(movieId: movieData!.id!),
        ),
        title: Text(movieData?.title ?? ''),
        subtitle: LocalizeText(
          LocaleKeys.home_voteCount,
          args: [movieData?.voteCount.toString() ?? ''],
        ),
        trailing: LocalizeText(
          LocaleKeys.home_average,
          args: [movieData?.voteAverage.toString() ?? ''],
        ),
      ),
    );
  }
}
