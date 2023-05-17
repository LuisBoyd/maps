import 'dart:async';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:convert' show utf8;
import 'dart:convert' show json;
import 'package:xml/xml.dart';
import 'dart:core';
import 'main.dart';
import 'page.dart';
import 'package:mapbox_gl/collection/colletion.dart';
import 'package:mapbox_gl/KmlXml/Model/placemark.dart';


class kmlPage extends ExamplePage{
  kmlPage() : super(const Icon(Icons.add_chart), 'Kml');

  @override
  Widget build(BuildContext context){
    return const kmlBody();
  }
}

class kmlBody extends StatefulWidget{
  const kmlBody();

  @override
  State<StatefulWidget> createState() => kmlBodyState();
}

class kmlBodyState extends State<kmlBody>{

  kmlBodyState() : array = new SmartArray(){
    print(array.toString());
  }

  static final LatLng center = const LatLng(52.801223114595615, -2.0830431561609304);
  MapboxMapController? controller;
  final SmartArray array;
  void _onMapCreated(MapboxMapController controller){
    this.controller = controller;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> Importkml() async {
    Uint8List? file = await PickKmlFile();
    //print(file!.lengthInBytes);
    var fileContents = utf8.decode(file!);
    List<Placemarkml> kmlMarkers = await ParseKml(fileContents);
    print(json.encode(kmlMarkers));
  }

  Future<Uint8List?> PickKmlFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,
    allowedExtensions: ['kml']);
    if(result != null){
      return result.files.first.bytes!;
    }
    return null;
  }

  Future<List<Placemarkml>> ParseKml(String data) async {
    var doc = XmlDocument
        .parse(data)
        .rootElement;
    if (doc.name.toString() != 'kml') {
      throw ("ERROR: the file is not a KML compatible file");
    }

    List<Placemarkml> resp = [];
    var elements = doc.findAllElements("Placemark");
    int cont = 0;
    elements.forEach((element) {
      cont++;
      String? name = element
          .getElement('name')
          ?.text;
      List<LatLng> points = [];
      var coordinates = element
          .findAllElements('coordinates')
          .first
          .text
          .trim()
          .split(' ');
      coordinates.forEach((element) {
        final dat = element.toString().split(",");
        double lat = double.parse(dat[1].toString());
        double lng = double.parse(dat[0].toString());
        points.add(LatLng(lat, lng));
      });
      if (name != null && points != null) {
        resp.add(Placemarkml(
            name: name,
            coordinates: points));
      }
      else if(points == null && name != null){
        resp.add(Placemarkml(
            name: name,
            coordinates: []));
      }
      else if(points != null && name == null){
        resp.add(Placemarkml(
            name: "",
            coordinates: points));
      }
      else if(points == null && name == null){
        resp.add(Placemarkml(
            name: "",
            coordinates: []));
      }
    });
    return resp;
  }



  @override
  Widget build(BuildContext context){
    // executeAfterBuild();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
            height: 400.0,
            child: MapboxMap(
              accessToken: MapsDemo.ACCESS_TOKEN,
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: const LatLng(52.801223114595615, -2.0830431561609304),
                zoom: 15.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: const Text("Import"),
                onPressed:() async {Importkml();},
              )
            ],
          ),
        )
      ],
    );
  }
}