import "package:test/test.dart";
import "package:geodesy/geodesy.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

void main() {
  Geodesy geodesy = Geodesy();

  test("distanceBetweenTwoGeoPoints", () async {
    final l1 = const maps.LatLng(50.06638889, 5.71472222);
    final l2 = const maps.LatLng(58.64388889, 3.07000000);
    final distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2);
    expect(distance, 968853.5466871752);
  });

  test("destinationPointByDistanceAndBearing", () async {
    final l3 = const maps.LatLng(51.4778, -0.0015);
    final destinationPoint =
        geodesy.destinationPointByDistanceAndBearing(l3, 7794.0, 300.7);
    expect(destinationPoint, const maps.LatLng(51.51354569174267, -0.0983453814483255));
  });

  test("bearingBetweenTwoGeoPoints", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final bearing = geodesy.bearingBetweenTwoGeoPoints(l4, l5);
    expect(bearing, 156.16658258153177);
  });

  test("bearingBetweenTwoGeoPoints", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final finalBearing = geodesy.finalBearingBetweenTwoGeoPoints(l4, l5);
    expect(finalBearing, 157.89044019049243);
  });

  test("midPointBetweenTwoGeoPoints", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
    expect(midpoint, const maps.LatLng(50.53632687827434, 1.2746141006782636));
  });

  test("midPointBetweenTwoGeoPoints", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final midpoint = geodesy.midPointBetweenTwoGeoPoints(l4, l5);
    expect(midpoint, const maps.LatLng(50.53632687827434, 1.2746141006782636));
  });

  test("isGeoPointInBoudingBox", () async {
    final l3 = const maps.LatLng(51.4778, -0.0015);
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final inBoudingBox = geodesy.isGeoPointInBoudingBox(l3, l5, l4);
    expect(inBoudingBox, false);
  });

  test("intersectionByPaths", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final b1 = 108.547;
    final b2 = 32.435;
    final intersectionByPaths = geodesy.intersectionByPaths(l4, l5, b1, b2);
    expect(intersectionByPaths, const maps.LatLng(51.151511446542756, 4.698604211862175));
  });

  test("crossTrackDistanceTo", () async {
    final l4 = const maps.LatLng(52.205, 0.119);
    final l5 = const maps.LatLng(48.857, 2.351);
    final l6 = const maps.LatLng(50.587, 1.231);
    final distanceToGreatCircle = geodesy.crossTrackDistanceTo(l4, l5, l6);
    expect(distanceToGreatCircle, 1240.3379338876143);
  });

  test("crossTrackDistanceTo", () async {
    List<maps.LatLng> poly = [
      const maps.LatLng(1.0, 1.0),
      const maps.LatLng(1.0, 2.0),
      const maps.LatLng(2.0, 2.0),
      const maps.LatLng(2.0, 1.0)
    ];
    maps.LatLng l7 = maps.LatLng(1.5, 1.5);
    bool isGeoPointInPolygon = geodesy.isGeoPointInPolygon(l7, poly);
    expect(isGeoPointInPolygon, true);
  });

  test("pointsInRange", () async {
    final point = const maps.LatLng(51.0, 0);
    final distance = 10000;
    final pointNotInRange = geodesy.destinationPointByDistanceAndBearing(
        point, distance + 10, 420.0);
    final pointInRange = geodesy.destinationPointByDistanceAndBearing(
        point, distance - 10, 420.0);
    final pointsToCheck = <maps.LatLng>[pointInRange, pointNotInRange];
    final geofencedPoints =
        geodesy.pointsInRange(point, pointsToCheck, distance);
    expect((geofencedPoints.contains(pointInRange)), true);
    expect((geofencedPoints.contains(pointNotInRange)), false);
  });
}