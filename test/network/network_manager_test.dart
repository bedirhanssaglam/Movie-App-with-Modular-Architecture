import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/product/init/config/app_environment.dart';
import 'package:moviemodular/product/service/manager/product_network_manager.dart';
import 'package:moviemodular/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager networkManager;
  setUp(() {
    AppEnvironment.general();
    networkManager = ProductNetworkManager.base();
  });
  test('fetch top rated movies from api', () async {
    final response = await networkManager.send<Movie, Movie>(
      ProductServicePath.topRated.path,
      parseModel: Movie(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
    expect(response.data!.results, isNotEmpty);
  });

  test('fetch now playing movies from api', () async {
    final response = await networkManager.send<Movie, Movie>(
      ProductServicePath.nowPlaying.path,
      parseModel: Movie(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
    expect(response.data!.results, isNotEmpty);
  });

  test('fetch movie details from api', () async {
    final response = await networkManager.send<MovieData, MovieData>(
      ProductServicePath.detail.withQuery(120),
      parseModel: MovieData(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });

  test('fetch all categories from api', () async {
    final response = await networkManager.send<Genres, Genres>(
      ProductServicePath.genres.path,
      parseModel: Genres(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
    expect(response.data!.genres, isNotEmpty);
  });
}
