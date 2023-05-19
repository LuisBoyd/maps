import 'package:mapbox_gl/Model/LatLng.dart';
// For type "LineString", the "coordinates" member is an array of two or
//    more positions.
class LineString{
  LineString(this.collection);
  final List<LatLng> collection;
}