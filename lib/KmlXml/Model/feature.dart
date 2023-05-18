import 'package:json_annotation/json_annotation.dart';
import 'package:mapbox_gl/KmlXml/Model/geometry.dart';
// part 'geometry.g.dart';

class Feature{
  final String type = "Feature";
  final Geometry geometry; //any Geometry object
  final Object properties; //any Json Object

  const Feature({required this.geometry, required this.properties});
//TODO Add Json Export and Import Info.
}
