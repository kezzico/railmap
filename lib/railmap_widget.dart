// RailMapWidget

// A Flutter Widget that scrolls horizontally and vertically.

// The contents of the widget is based on RailMap. Each RailRoute is rendered as a
// polyline with each point on the line being a RailStation. Each RailRoute has a
// color that defines the color of the polyline. RailStations have a RailCoordinate
// which determines the vertices of the polyline.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:railmap/railmap.dart';
import 'package:railmap/railmap_trackpainter.dart';

class RailMapWidget extends StatelessWidget {
  final Size size;

  const RailMapWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    Size viewsize = size;

    const mapsize = Size(800, 1033);

    Offset mapcenter = Offset(viewsize.width / 2, viewsize.height / 2);

    RailMap map = RailMap();
    map.addRoute(
        RailRoute(name: 'Seattle to Portland', color: Colors.red, stations: [
      RailStation("Seattle", [400, 0]),
      RailStation("Tacoma", [-400, 0]),
      RailStation("Olympia", [0, 0]),
      RailStation("Portland", [0, -516]),
      RailStation("Portland", [0, 516]),
    ]));

    return InteractiveViewer(
        minScale: 1.0,
        scaleEnabled: true,
        constrained: false,
        maxScale: 16.0,
        clipBehavior: Clip.hardEdge,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              width: mapsize.width,
              height: mapsize.height,
              left: 0,
              top: 0,
              child: Container(
                color: const Color(0xFF00AADD),
              )),
          SvgPicture.asset(
            'assets/pugetsound.svg',
            width: mapsize.width,
            height: mapsize.height,
            fit: BoxFit.none,
          ),
          CustomPaint(
            painter: RailmapTrackPainter(
                center: mapcenter, railmap: map),
          )
        ]));
  }
}
