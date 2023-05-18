import 'package:json_annotation/json_annotation.dart';
import 'coordinates.dart';
import 'package:quiver/core.dart';

part 'geometry.g.dart';

@JsonSerializable()
class Geometry{
  String type;
  List<Coordinates> coordinates;

  Geometry({required this.type, required this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic>json) => _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);


}