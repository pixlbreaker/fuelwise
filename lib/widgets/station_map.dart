// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fuelwise/pages/stations_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class StationMap extends StatelessWidget {
  const StationMap(this.station, this.a, this.b, {super.key});

  final StationPage station;
  final double a;
  final double b;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(station.lat, station.lng),
          initialZoom: 13.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: [
            Marker(
              point: LatLng(station.lat, station.lng),
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
