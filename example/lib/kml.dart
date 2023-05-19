import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_gl/GeoJsonConversionManager.dart';
import 'package:mapbox_gl/ConversionType.dart';
import 'dart:convert' show utf8;
import 'dart:convert' show json;
import 'package:xml/xml.dart';
import 'dart:core';
import 'main.dart';
import 'page.dart';

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

  static final LatLng center = const LatLng(52.801223114595615, -2.0830431561609304);
  MapboxMapController? controller;
  GeoJsonConversionManager? conversionController;

  void _onMapCreated(MapboxMapController controller){
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> Importkml() async {
    Uint8List? file = await PickKmlFile();
    var fileContents = utf8.decode(file!);
    //1.take the string and parse it to xml doc.
    //2.fill in the value for the geojsonManager
    conversionController = GeoJsonConversionManager(fileContents, ConversionType.Kml);
    var featureCollection = conversionController!.Convert();

  }

  Future<Uint8List?> PickKmlFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,
    allowedExtensions: ['kml']);
    if(result != null){
      return result.files.first.bytes!;
    }
    return null;
  }




  @override
  Widget build(BuildContext context){
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