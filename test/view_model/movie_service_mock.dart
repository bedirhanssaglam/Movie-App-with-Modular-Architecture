import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';

final class MovieServiceMock extends Mock implements MovieOperation {
  @override
  Future<Movie> fetchTopRatedMovies() async => Movie(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [MovieData(id: 1)],
      );

  @override
  Future<Movie> fetchNowPlayingMovies() async => Movie(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [MovieData(id: 1)],
      );

  @override
  Future<MovieData> fetchMovieDetails(int id) async => MovieData(id: id);
}
