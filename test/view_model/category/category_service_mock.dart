import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';

final class CategoryServiceMock extends Mock implements MovieOperation {
  @override
  Future<Genres> fetchAllCategories() async {
    return Genres(
      genres: [
        GenresData(id: 1, name: 'Action'),
        GenresData(id: 2, name: 'Comedy'),
      ],
    );
  }
}
