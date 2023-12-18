import 'package:gen/gen.dart';

abstract class MovieOperation {
  Future<Movie?> fetchTopRatedMovies();
  Future<Movie?> fetchNowPlayingMovies();
  Future<MovieData?> fetchMovieDetails(int movieId);
  Future<Genres?> fetchAllCategories();
}
