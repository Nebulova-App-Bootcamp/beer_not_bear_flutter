import "package:json_annotation/json_annotation.dart";

part 'boil_volume.g.dart';

@JsonSerializable()
class BoilVolume {
  int? value;
  String? unit;

  BoilVolume(this.unit, this.value);

  factory BoilVolume.fromJson(Map<String, dynamic> json) =>
      _$BoilVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$BoilVolumeToJson(this);
}
