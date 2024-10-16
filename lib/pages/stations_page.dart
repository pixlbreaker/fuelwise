// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/service/map_service.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';
import 'package:fuelwise/service/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class StationPage extends StatefulWidget {
  const StationPage(
      {super.key, required this.station, required this.lat, required this.lng});

  final Results station;
  final double lat;
  final double lng;

  @override
  State<StationPage> createState() => _StationPage();
}

class _StationPage extends State<StationPage> {
  int currentPageIndex = 0;
  double latitude = 0.0;
  double longitude = 0.0;
  final _LocationService = LocationService();

  _fetchLocation(Results station) async {
    Position position = await _LocationService.getLatLong();
    var loc = await _LocationService.getLatLongFromAddress(station.address.line1);
    latitude = loc.$1;
    longitude = loc.$2;
  }

  @override
  void initState() {
    _fetchLocation(widget.station);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.station.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.station.address.line1,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              "${widget.station.address.locality} ${widget.station.address.postalCode}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            const Text(
              "Fuel Prices",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            pricesList(),
            const SizedBox(height: 8),
            flutterMap(),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                MapUtils.openMapAddress(widget.station.address.line1);
              },
              child: const Text('Open Google Maps'),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox flutterMap() {
    return SizedBox(
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
                ),),
            Marker(
                point: LatLng(latitude, longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                )),
          ]),
        ],
      ),
    );
  }

  ListView pricesList() {
    return ListView.builder(
      itemCount: widget.station.prices.length,
      itemBuilder: (context, index) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMMd()
                    .format(widget.station.prices[index].credit.postedDate),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '\$${widget.station.prices[index].credit.price.toString()}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      centerTitle: true,
      title: const Text("Fuel Wise"),
      actions: [
        NotificationBell(),
      ],
    );
  }
}
