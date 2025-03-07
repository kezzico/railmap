import 'package:flutter/material.dart';
import 'package:railmap/railmap.dart';

class RailmapTrackPainter extends CustomPainter {
  final double scale;
  final RailMap railmap;

  RailmapTrackPainter({required this.railmap, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final stationRadius = 10 * scale;
    final stationStroke = 10 * scale;
    final trackStroke = 10 * scale;

    railmap.eachRoute((RailRoute route) {
      final pTrack = Paint();
      pTrack.color = route.color;
      pTrack.style = PaintingStyle.stroke;
      pTrack.strokeWidth = trackStroke;

      final pStation = Paint();
      pStation.color = Colors.black;
      pStation.style = PaintingStyle.fill;

      for (var i = 0; i < route.stations.length - 1; i++) {
        final station1 = route.stations[i];
        final station2 = route.stations[i + 1];

        final x1 = station1.coordinate[0];
        final y1 = station1.coordinate[1];

        final x2 = station2.coordinate[0];
        final y2 = station2.coordinate[1];

        final start = Offset(x1, y1);
        final end = Offset(x2, y2);

        canvas.drawLine(start, end, pTrack);

        canvas.drawCircle(start, stationRadius, pStation);
      }

      canvas.drawCircle(Offset(route.stations.last.coordinate[0], route.stations.last.coordinate[1]), stationRadius, pStation);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
  }
}
