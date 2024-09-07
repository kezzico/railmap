import 'package:flutter_test/flutter_test.dart';
import 'package:railmap/railmap.dart';
import 'package:flutter/material.dart';

/*
 * Tests for the map module
 */

// TODO: add tests for the following functions:
// - create a color from an integer
// - create a route from stations
// - create a station from a coordinate and name
// - get all routes that pass through a given station
// - get all stations on a route
// - get all routes in the map
// - get all stations in the map
// - get the distance between two stations
// - get the shortest path between two stations
// - get the shortest path between two stations with a maximum number of transfers
// - get the shortest path between two stations with a maximum walking distance
// - get the shortest path between two stations with a maximum walking distance and a maximum number of transfers

/*
 * Example test:
 */
void main() {
  test('create a color from an integer', () {
    // See the following for more information
    // https://api.flutter.dev/flutter/dart-ui/Color-class.html.

    const int n = 0xFF110011;

    Color c1 = const Color(n);
    // print hello world

    expect(n, c1.value);
  });

  test('create a route from stations', () {
    final stationHoytstreet = RailStation('Hoyt Street', [0, 0]);
    final stationBoroughhall = RailStation('Hoyt Street', [0, 1]);
    final stationWallstreet = RailStation('Hoyt Street', [0, 0]);
    final stationCanalstreet = RailStation('Hoyt Street', [0, 0]);
    final stationChambersstreet = RailStation('Hoyt Street', [0, 0]);
    final stationRector = RailStation('Hoyt Street', [0, 0]);
    final stationSouthferry = RailStation('Hoyt Street', [0, 0]);

    final nyc1Train = RailRoute(
        name: "1 line local",
        color: Colors.red,
        stations: <RailStation>[
          stationCanalstreet,
          stationChambersstreet,
          stationRector,
          stationSouthferry
        ]);

    final nyc6Train = RailRoute(
        name: "6 local train",
        color: Colors.blue,
        stations: <RailStation>[
          stationBoroughhall,
          stationHoytstreet,
          stationWallstreet,
          stationChambersstreet
        ]);

    final map = RailMap();

    map.addRoute(nyc1Train);
    map.addRoute(nyc6Train);

    expect(map.getRoute("1 line local"), isNotNull);
    expect(map.getRoute("6 local train"), isNotNull);
    expect(
        map.getRoute("A train that is not real! .... The ghost train"), isNull);

    // test eachRoute
    map.eachRoute((route) {});
  });
}
