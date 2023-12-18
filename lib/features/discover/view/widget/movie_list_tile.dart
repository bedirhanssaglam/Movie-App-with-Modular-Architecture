part of '../discover_view.dart';

final class _MovieListTile extends StatelessWidget {
  const _MovieListTile({
    required this.movieData,
  });

  final MovieData movieData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => context.pushRoute(
          DetailsRoute(movieId: movieData.id!),
        ),
        title: Text(movieData.title ?? ''),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
