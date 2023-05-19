import 'package:mapbox_gl/Model/FeatureCollection.dart';
import 'package:mapbox_gl/Model/Geometry.dart';
import 'package:xml/xml.dart';
import 'package:mapbox_gl/ConversionType.dart';
import 'package:mapbox_gl/Model/Feature.dart';
class GeoJsonConversionManager{

  final String fileContent;
  final ConversionType conversionType;
  GeoJsonConversionManager(this.fileContent, this.conversionType);

  FeatureCollection Convert(){
    switch(conversionType){
      case ConversionType.Kml:
        return _ConvertFromKml();
        break;
    }
  }

  FeatureCollection _ConvertFromKml(){
    //1.Convert the Kml string to a XmlDocument
    XmlDocument Doc = XmlDocument.parse(fileContent);
    //2.Get all the Placemark objects.
    var Placemarks = Doc.findAllElements('Placemark');
    //3.Crawl through all the placemark objects and make them feature objects
    return _CrawlthroughPlacemarks(Placemarks);
  }

  FeatureCollection _CrawlthroughPlacemarks(Iterable<XmlElement> elements){
    //1. Create a list of features
    List<Feature> features = [];
    //2. itterate over each XmlElement
    for(var element in elements){
      features.add(_CreateFeatureFromKmlElements(element));
    }
    return FeatureCollection(features: features);
  }

  Feature _CreateFeatureFromKmlElements(XmlElement element){
    //1.Create a "Empty Feature"
    Feature feature = Feature();
    //2.first find out the type of geometry to create
    //this can be done by looking at this element for a coordinate object if it contains a node of this type amazing if not return null
    //once we have that run it through _findGeometryType() which returns a string.
    String? geomtryType = FindGeometryType(element);
    geomtryType = geomtryType != null ? geomtryType: "";
    print(geomtryType!);
    return feature;
  }
  
  String? FindGeometryType(XmlElement element){
    //1.find the coordinate node(s)
    var coordinateElement = element.findAllElements("coordinates");
    var GrandParentElement = coordinateElement.first!.parent!.parent; //could be null TODO safety
    //2.if there is more than one node that fits this description then we know it's a MultiGeometry
    // bool isMultiGeometry = coordinateElement.any((element) => element.name.qualified.contains("/([Mm][Uu][Ll][Tt][Ii])/"));
    // bool isMultiGeometry = GrandParentElement!.outerXml.contains(RegExp(r"/Multi/g"));
    bool isMultiGeometry = GrandParentElement!.text.contains(RegExp(r"/Multi/g"));
    print(GrandParentElement!.text);
    //3. if its multiGeometry search for that specific tags otherwise search for the singletags
    XmlElement tag;
    if(isMultiGeometry){
      //3.5 get any multi entry
      tag = element.findElements('annotation', namespace: '*').
    where((element) => element.name.qualified == "MultiPoint" ||
      element.name.qualified == "MultiLineString" || element.name.qualified == "MultiPolygon").first;
    }
    else{
      tag = element.findElements('annotation', namespace: '*').
    where((element) => element.name.qualified == "Point" || element.name.qualified == "LineString" || element.name.qualified == "Polygon").first;
    }
    if(tag != null){
      return tag.name.qualified;
    }
    return null;
  }





}