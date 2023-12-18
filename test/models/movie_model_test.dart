import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';

void main() {
  group('Movie Model Test', () {
    test('supports value comparison', () {
      expect(
        Movie(
          page: 1,
          totalPages: 1,
          totalResults: 1,
          results: [MovieData(id: 1)],
        ),
        Movie(
          page: 1,
          totalPages: 1,
          totalResults: 1,
          results: [MovieData(id: 1)],
        ),
      );
    });
  });
}
