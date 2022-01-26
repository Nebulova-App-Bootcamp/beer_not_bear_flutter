import 'package:beer_not_bear_flutter/models/boil_volume.dart';

import "package:json_annotation/json_annotation.dart";

part 'beer.g.dart';

@JsonSerializable()
class Beer {
  int? id;
  BoilVolume? boil_volume;
  String? name;
  String? image_url;
  String? description;
  String? tagline;
  bool? isFavourite;

  Beer(
      {this.id,
      this.name,
      this.image_url,
      this.description,
      this.boil_volume,
      this.tagline,
      this.isFavourite});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
