import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        
      ),
      child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(10.276398897574836, 123.97817139645723),
            initialZoom: 11,
            interactionOptions:
                const InteractionOptions(flags: InteractiveFlag.doubleTapZoom),
          ),
          children: [
            openStreetMapTileLayer,
          ],
        ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
