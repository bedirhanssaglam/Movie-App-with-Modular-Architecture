abstract interface class _ProductServicePathOperation {
  String get path;
  String withQuery(int queryValue);
}

enum ProductServicePath implements _ProductServicePathOperation {
  topRated('movie/top_rated'),
  nowPlaying('movie/now_playing'),
  detail('movie'),
  genres('genre/movie/list');

  const ProductServicePath(this._reference);

  final String _reference;

  @override
  String get path => _reference;

  @override
  String withQuery(int queryValue) => '$path/$queryValue';
}
