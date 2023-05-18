import 'dart:ffi';

import 'package:mapbox_gl/KmlXml/Model/FeatureCollection.dart';
import 'package:mapbox_gl/KmlXml/Model/feature.dart';
import 'package:xml/xml.dart';

class GeoJsonConversionManager{

  //Create method for taking in KML and spitting out feature collection object
  FeatureCollection ConvertFromKML(XmlDocument doc){
    List<Feature> features = [];

    //Find all the placemarks in the document
    var placemarks = doc.findAllElements("Placemark");
    //Itterate through all placemarks.
    placemarks.forEach((element) {
      //Look at DOD design + the c# kml implementation.
    });

    return FeatureCollection(features: []);
  }

  //does this XMLElement contain a tag for <MultiGeometry>
  bool ContainsMultiGeometry(XmlElement elem){
    const TagCheck = "MultiGeometry";
    //Get Descendants
    final Descendants = elem.descendants;

    for(var element in Descendants){
      if(element.text.toLowerCase() == TagCheck.toLowerCase())
        return true;
    }
    return false;
  }

  //Get all properties of a Placemark Object anything that's not a
  /*
  -id
  -Geometry Object
  -type
   */
  // Map<String,dynamic> GetAllProperties(XmlElement elem){
  //
  //   if(elem.)
  //
  //   const Tags = ["Point","MultiPoint","LineString",
  //   "MultiLineString", "Polygon","MultiPolygon","MultiGeometry","GeometryCollection",
  //   "id"];
  //
  //   //Assume that this is currently a placemarker object
  //   //Extract the id Attribute from the placemarker object.
  //   final id = {elem.attributes.first.name,elem.attributes.first.value}; //Not Safe
  //
  //   //Get all Elements that don't have those tags in the const
  //   final elements = elem.findAllElements("xsd:annotation")
  //   .where((element) => !Tags.any((tag) => element.name.qualified == tag));
  //
  //   //Loop through these
  // }

}