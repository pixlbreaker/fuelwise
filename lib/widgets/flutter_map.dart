import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fuelwise/pages/stations_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FlutterMap extends StatelessWidget {
  const FlutterMap({
    super.key,
    required this.widget,
    required this.a,
    required this.b,
  });

  final StationPage widget;
  final double a;
  final double b;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(widget.lat, widget.lng),
          initialZoom: 13.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: [
            Marker(
              point: LatLng(widget.lat, widget.lng),
              child: const Icon(
                Icons.location_pin,
                color: Colors.red,
              ),
            ),
            Marker(
                point: LatLng(a, b),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                )),
          ]),
        ],
      ),
    );
  }
}
