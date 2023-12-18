import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:gen/src/models/genres_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'genres.g.dart';

@JsonSerializable()
@immutable
final class Genres extends INetworkModel<Genres> with EquatableMixin {
  final List<GenresData>? genres;

  Genres({
    this.genres,
  });

  @override
  Genres fromJson(Map<String, dynamic> json) => Genres.fromJson(json);

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GenresToJson(this);

  @override
  List<Object?> get props => [genres];
}
