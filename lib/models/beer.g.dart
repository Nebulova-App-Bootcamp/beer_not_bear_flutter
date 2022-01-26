// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image_url: json['image_url'] as String?,
      description: json['description'] as String?,
      boil_volume: json['boil_volume'] == null
          ? null
          : BoilVolume.fromJson(json['boil_volume'] as Map<String, dynamic>),
      tagline: json['tagline'] as String?,
      isFavourite: json['isFavourite'] as bool?,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'id': instance.id,
      'boil_volume': instance.boil_volume,
      'name': instance.name,
      'image_url': instance.image_url,
      'description': instance.description,
      'tagline': instance.tagline,
      'isFavourite': instance.isFavourite,
    };
