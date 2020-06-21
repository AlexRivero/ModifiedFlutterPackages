import '../lib/geodesy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

void main() async {
  Geodesy geodesy = Geodesy();
  maps.LatLng l1 = maps.LatLng(50.06638889, 5.71472222);
  maps.LatLng l2 = maps.LatLng(58.64388889, 3.07000000);

  num distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2);
  print("[distanceBetweenTwoGeoPoints] Distance: " + distance.toString());

  maps.LatLng l3 = maps.LatLng(51.4778, -0.0015);
  maps.LatLng distinationPoint =
      geodesy.destinationPointByDistanceAndBearing(l3, 7794.0, 300.7);
  print("[destinationPointByDistanceAndBearing] Lat: " +
      distinationPoint.latitude.toString());
  print("[destinationPointByDistanceAndBearing] Lng: " +
      distinationPoint.longitude.toString());

  maps.LatLng l4 = maps.LatLng(52.205, 0.119);
  maps.LatLng l5 = maps.LatLng(48.857, 2.351);
  num bearing = geodesy.bearingBetweenTwoGeoPoints(l4, l5);
  print("[bearingBetweenTwoGeoPoints] Bearing: " + bearing.toString());

  num finalBearing = geodesy.finalBearingBetweenTwoGeoPoints(l4, l5);
  print("[finalBearingBetweenTwoGeoPoints] Bearing:" + finalBearing.toString());

  maps.LatLng midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
  print("[midPointBetweenTwoGeoPoints] Midpoint Lat: " +
      midpoint.latitude.toString());
  print("[midPointBetweenTwoGeoPoints] Midpoint Lng: " +
      midpoint.longitude.toString());

  bool inBoudingBox = geodesy.isGeoPointInBoudingBox(l3, l5, l4);
  print("[isGeoPointInBoudingBox]: " + inBoudingBox.toString());

  num b1 = 108.547;
  num b2 = 32.435;
  maps.LatLng intersectionByPaths = geodesy.intersectionByPaths(l4, l5, b1, b2);
  print(
      "[intersectionByPaths] Lat: " + intersectionByPaths.latitude.toString());
  print(
      "[intersectionByPaths] Lng: " + intersectionByPaths.longitude.toString());

  maps.LatLng l6 = maps.LatLng(50.587, 1.231);
  num distanceToGreatCircle = geodesy.crossTrackDistanceTo(l4, l5, l6);
  print("[crossTrackDistanceTo] :" + distanceToGreatCircle.toString());

  List<maps.LatLng> poly = [
    maps.LatLng(1.0, 1.0),
    maps.LatLng(1.0, 2.0),
    maps.LatLng(2.0, 2.0),
    maps.LatLng(2.0, 1.0)
  ];
  maps.LatLng l7 = maps.LatLng(1.5, 1.5);
  bool isGeoPointInPolygon = geodesy.isGeoPointInPolygon(l7, poly);
  print("[isGeoPointInPolygon] :" + isGeoPointInPolygon.toString());
}
