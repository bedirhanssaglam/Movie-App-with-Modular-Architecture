import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:gen/src/models/movie_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie.g.dart';

@JsonSerializable()
@immutable
final class Movie extends INetworkModel<Movie> with EquatableMixin {
  final int? page;
  final List<MovieData>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  Movie fromJson(Map<String, dynamic> json) => Movie.fromJson(json);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
