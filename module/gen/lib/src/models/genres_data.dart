import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'genres_data.g.dart';

@JsonSerializable()
@immutable
final class GenresData extends INetworkModel<GenresData> with EquatableMixin {
  final int? id;
  final String? name;

  GenresData({
    this.id,
    this.name,
  });

  @override
  GenresData fromJson(Map<String, dynamic> json) => GenresData.fromJson(json);

  factory GenresData.fromJson(Map<String, dynamic> json) =>
      _$GenresDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GenresDataToJson(this);

  @override
  List<Object?> get props => [id, name];
}
