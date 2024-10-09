import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/service/map_service.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';
import 'package:fuelwise/service/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class StationPage extends StatefulWidget {
  const StationPage({super.key, required this.station});

  final Results station;

  @override
  State<StationPage> createState() => _StationPage();
}

class _StationPage extends State<StationPage> {
  int currentPageIndex = 0;

  // Gets the location
  double lat = 51.1;
  double lng = 3.0;
  final _LocationService = LocationService();

  _fetchLocation() async {
    Position position = await _LocationService.getLatLong();
    lat = position.latitude;
    lng = position.longitude;
  }

  @override
  void initState() {
    super.initState();
    _fetchLocation();
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.station.address.line1,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              widget.station.address.locality +
                  " " +
                  widget.station.address.postalCode,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              "Fuel Prices",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            pricesList(),
            SizedBox(height: 8),
            Container(
              height: 250,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(lat, lng),
                  initialZoom: 9.1,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution('OpenStreetMap contributors',
                          onTap: () =>
                              {} //launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                          ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                MapUtils.openMapAddress(widget.station.address.line1);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("Navigating to station details...")),
                // );
              },
              child: Text('Open Google Maps'),
            ),
          ],
        ),
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
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '\$${widget.station.prices[index].credit.price.toString()}',
                style: TextStyle(fontSize: 16),
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
