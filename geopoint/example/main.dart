import 'package:geopoint/geopoint.dart';
// import 'package:latlong/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  Place(this.name, this.point);

  final String name;
  final LatLng point;
}

final List<Place> places = [
  Place("Notre-Dame", const LatLng(48.853831, 2.348722)),
  Place("Montmartre", const LatLng(48.886463, 2.341169)),
  Place("Champs-Elysées", const LatLng(48.873932, 2.294821)),
  Place("Chinatown", const LatLng(48.827393, 2.361897)),
  Place("Tour Eiffel", const LatLng(48.85801, 2.294713))
];

Future<void> main() async {
  final geoPoints = <GeoPoint>[];
  print("Places in Paris:");
  for (final place in places) {
    final geoPoint = GeoPoint.fromLatLng(name: place.name, point: place.point);
    print("${geoPoint.toMap()}");
    geoPoints.add(geoPoint);
  }
  print("Geoserie:");
  final geoSerie = GeoSerie(
      name: "Paris places", type: GeoSerieType.group, geoPoints: geoPoints);
  print("${geoSerie.toMap()}");
  for (final gp in geoSerie.geoPoints) {
    print("${gp.name}: ${gp.latitude}/${gp.longitude}");
  }
}
