import 'package:json_annotation/json_annotation.dart';
part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates{
  double lat;
  double lng;

  Coordinates(this.lat, this.lng);

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
