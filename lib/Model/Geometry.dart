import 'package:mapbox_gl/Model/LatLng.dart';
// o  The value of a Geometry object's "type" member MUST be one of the
// seven geometry types (see Section 1.4).
//
// o  A GeoJSON Geometry object of any type other than
// "GeometryCollection" has a member with the name "coordinates".
// The value of the "coordinates" member is an array.  The structure
// of the elements in this array is determined by the type of
// geometry.  GeoJSON processors MAY interpret Geometry objects with
// empty "coordinates" arrays as null objects.

abstract class Geometry{
  Geometry({required this.type, required this.coordinates});
  String type;
  List<LatLng> coordinates;
}