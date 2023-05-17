import 'package:mapbox_gl/mapbox_gl.dart';

class Placemark{

  Placemark(this.name, this.description, this.id);

  final String id;
  final String name;
  final String? description;

 Map<String, dynamic> toJson(){
    return{
      "name": name != null ? name : "",
      "description" : description != null ? description : ""
    };
  }

}

class Geometry{} //Add override method for writing it out to json.

class Point extends Geometry{
  Point(this.point);
  final LatLng point;
}

class MultiPoint extends Geometry{
  MultiPoint(this.Points);
  final List<Point> Points;
}

class LineString extends Geometry{
  LineString(this.Points); //Order is important in a line string.
  final List<Point> Points;
}

class MultiLineString extends Geometry{
  MultiLineString(this.LineStrings);
  final List<LineString> LineStrings;
}

// class Polygon extends Geometry{
//   Polygon(){
//     var l = List.generate(3, (index) => null);
//   }
//
// }

class MultiGeometry extends Geometry{
  MultiGeometry(this.Geometries);
  final List<Geometry> Geometries;
}
class Placemarkml {
  String name;
  List<LatLng> coordinates;
  bool valid;
  Placemarkml({required this.name, required this.coordinates, this.valid = true});
}

