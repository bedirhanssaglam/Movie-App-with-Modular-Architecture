import 'package:gen/gen.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';
import 'package:moviemodular/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class MovieService implements MovieOperation {
  MovieService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<Movie?> fetchTopRatedMovies() async {
    final response = await _networkManager.send<Movie, Movie?>(
      ProductServicePath.topRated.path,
      parseModel: Movie(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<Movie?> fetchNowPlayingMovies() async {
    final response = await _networkManager.send<Movie, Movie?>(
      ProductServicePath.nowPlaying.path,
      parseModel: Movie(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<MovieData?> fetchMovieDetails(int movieId) async {
    final response = await _networkManager.send<MovieData, MovieData?>(
      ProductServicePath.detail.withQuery(movieId),
      parseModel: MovieData(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<Genres?> fetchAllCategories() async {
    final response = await _networkManager.send<Genres, Genres?>(
      ProductServicePath.genres.path,
      parseModel: Genres(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
