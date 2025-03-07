import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:railmap/railmap.dart';
import 'package:railmap/railmap_widget.dart';
import 'package:railmap/railmap_generated.dart';
import 'package:railmap/railmap_loader.dart';
import 'package:railmap/root_widget_state.dart';
import 'package:railmap/railmap_loader.dart';

class RailTrackerRootWidget extends StatelessWidget {
  const RailTrackerRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.sizeOf(context);

    const goldenratioinverse = 0.618;

    double splitHeight = screensize.height * 1;

    return ChangeNotifierProvider<RootWidgetState>(
      create: (_) => RootWidgetState(),
      builder: (context, _) {
        return Stack(
          children: [
            _TopWidget(height: splitHeight),
            _BottomWidget(height: splitHeight),
          ],
        );
      },
    );
  }
}

class _TopWidget extends StatelessWidget {
  final double height;

  const _TopWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.sizeOf(context);
    Size mapsize = Size(screensize.width, height);

    return RailmapLoader(onLoad: (map) {
      return Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height,
          child: RailMapWidget(size: mapsize, map: map));
    }, load: () {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        height: height,
        child: Container(
          color: Colors.blue,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }
}

class _BottomWidget extends StatelessWidget {
  final double height;

  const _BottomWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: height,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
