import 'package:json_annotation/json_annotation.dart';
import 'coordinates.dart';

part 'placemark.g.dart';


class Geometry{} //Add override method for writing it out to json.

class Point extends Geometry{
  // Point(this.point);
  // // final C point;
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

@JsonSerializable()
class Placemarkml {
  String name;
  List<Coordinates> coordinates;
  bool valid;
  Placemarkml(this.name, this.coordinates, this.valid);

  factory Placemarkml.fromJson(Map<String, dynamic> json) => _$PlacemarkmlFromJson(json);

  Map<String, dynamic> toJson() => _$PlacemarkmlToJson(this);

}

