import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:railmap/railmap.dart';
import 'package:railmap/railmap_generated.dart';

import 'dart:convert';

class RailmapLoader extends StatelessWidget {
    final Widget Function(RailMap map) onLoad;
    final Widget Function() load;

    const RailmapLoader({
        Key? key,
        required this.onLoad,
        required this.load,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return this.onLoad(generatedRailmap());
        
        
        // FutureBuilder<Map<String, dynamic>>(
        //     future: fetchRailmapData(),
        //     builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //             return load();
        //         } else if (snapshot.hasError) {
        //             return load();
        //         } else if (snapshot.hasData) {
        //             RailMap map = RailMap.fromJson(snapshot.data);
        //             return onLoad(map);
        //         } else {
        //             return Text('No data available');
        //         }
        //     },
        // );

        // return Future<Map<String, dynamic>> async {
        //     final response = await http.get(Uri.parse('https://dev.kezzi.co/railmap/map'));

        //     if (response.statusCode == 200) {
        //         return json.decode(response.body);
        //     } else {
        //         throw Exception('Failed to load railmap data');
        //     }
        // };
    }

}

Future<Map<String, dynamic>> fetchRailmapData() async {
    final response = await http.get(Uri.parse('https://dev.kezzi.co/railmap/map'));

    if (response.statusCode == 200) {
        return json.decode(response.body);
    } else {
        throw Exception('Failed to load railmap data');
    }
}


        // @override
        // Widget build(BuildContext context) {
        //     return FutureBuilder<Map<String, dynamic>>(
        //         future: fetchRailmapData(),
        //         builder: (context, snapshot) {
        //             if (snapshot.connectionState == ConnectionState.waiting) {
        //                 return load();
        //             } else if (snapshot.hasError) {
        //                 return load();
        //             } else if (snapshot.hasData) {
        //                 // RailMap map = RailMap.fromJson(snapshot.data);
        //                 RailMap map = RailMap.generatedRailmap();
        //                 return this.onLoad(map);
        //             } else {
        //                 return Text('No data available');
        //             }
        //         },
        //     );
        // }
