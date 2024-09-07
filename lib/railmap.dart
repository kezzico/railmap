import 'package:flutter/material.dart';
export 'package:railmap/railmap.dart'
    show RailMap, RailStation, RailRoute;

//
// RailMap
//
class RailMap {
  // a set of RailRoutes
  final Map<String, RailRoute> routesByName = {};

  // a function to add a RailRoute
  void addRoute(RailRoute route) => routesByName[route.name] = route;

  // a function to find a RailRoute by name
  RailRoute? getRoute(String name) => routesByName[name];

  // a function to iterate over all RailRoutes.
  // accepts a callback parameter with a parameter for a single RailRoute in the collection
  void eachRoute(void Function(RailRoute route) callback) =>
      routesByName.forEach((k, v) {
        callback(v);
      });

  // void eachRoute(void Function(RailRoute route) callback, {required Null Function(RailRoute route) callback}) =>
  //     routesByName.forEach((k, v) {
  //       callback(v);
  //     });
}

//
// RailRoute
//
class RailRoute {
  // a list of stations
  final Color color; // ARGB, use 0xFF000000 for opague black
  final List<RailStation> stations;
  final String name;

  RailRoute(
      {required this.name, this.color = Colors.black, required this.stations});
}

//
// RailStation
//
class RailStation {
  // a coordinate on the map
  List<int> coordinate;
  final String name;

  // a constructor that takes an array of x and y then creates a RailCoordinate
  RailStation(this.name, this.coordinate);
}
