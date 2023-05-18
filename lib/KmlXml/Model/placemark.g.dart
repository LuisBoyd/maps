// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placemark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Placemarkml _$PlacemarkmlFromJson(Map<String, dynamic> json) => Placemarkml(
      json['name'] as String,
      (json['coordinates'] as List<dynamic>)
          .map((e) => Coordinates.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['valid'] as bool,
    );

Map<String, dynamic> _$PlacemarkmlToJson(Placemarkml instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coordinates': instance.coordinates,
      'valid': instance.valid,
    };
