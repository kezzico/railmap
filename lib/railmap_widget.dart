import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:railmap/railmap.dart';
import 'package:railmap/railmap_trackpainter.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RailMapWidget extends StatefulWidget {
  final Size size;
  final RailMap map;

  double scale = 1.0;
  Offset pan = Offset(0, 0);

  RailMapWidget({super.key, required this.size, required this.map});

  @override
  _RailMapWidgetState createState() => _RailMapWidgetState();
}

class _RailMapWidgetState extends State<RailMapWidget> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    Size viewsize = widget.size;

    const mapsize = Size(1127, 2660);

    Offset mapcenter = Offset(viewsize.width / 2, viewsize.height / 2);

    return InteractiveViewer(
      transformationController: _transformationController,
      onInteractionUpdate: (details) {
        setState(() {
          var pan = _transformationController.value.getTranslation();
          widget.pan = Offset(pan.x, pan.y);

          var scale = 1 / _transformationController.value.getMaxScaleOnAxis();
          widget.scale = scale;
        });
      },
      minScale: 1.0,
      scaleEnabled: true,
      constrained: false,
      maxScale: 16.0,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned( 
            width: mapsize.width,
            height: mapsize.height,
            left: 0,
            top: 0,
            child: Container(
                color: const Color(0xFF00AADD),
                width: mapsize.width,
                height: mapsize.height),
          ),
          SvgMap(mapsize: mapsize, offset: widget.pan, scale: widget.scale),
          CustomPaint(
            painter: RailmapTrackPainter(
                center: mapcenter, railmap: widget.map, scale: widget.scale),
          ),
        ],
      ),
    );
  }
}

class SvgMap extends StatelessWidget {
  final Size mapsize;

  final Offset offset;

  final double scale;

  const SvgMap(
      {super.key,
      required this.mapsize,
      required this.offset,
      required this.scale});

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      SvgPicture.asset(
        'assets/pugetsound_notracks.svg',
        width: mapsize.width,
        height: mapsize.height,
        fit: BoxFit.none,
      ),
    ]);
  }
}
