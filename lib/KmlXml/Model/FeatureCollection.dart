import 'feature.dart';
class FeatureCollection{
  final String type = "FeatureCollection";
  final List<Feature> features;

  const FeatureCollection({required this.features});
  //TODO Add Json Export and Import Info.
}