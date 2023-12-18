import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_data.g.dart';

@JsonSerializable()
@immutable
final class MovieData extends INetworkModel<MovieData> with EquatableMixin {
  MovieData({
    this.backdropPath,
    this.id,
    this.homepage,
    this.status,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? id;
  final String? status;
  final String? homepage;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  @override
  MovieData fromJson(Map<String, dynamic> json) => MovieData.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieDataToJson(this);

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        homepage,
        status,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
