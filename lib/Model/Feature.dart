import 'Geometry.dart';

class Feature{
  final String type = "Feature";
  Geometry? geometry; //any Geometry object
  Object? properties; //any Json Object

  Feature();
}