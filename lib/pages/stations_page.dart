import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/pages/gas_station.dart';
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
  // ignore: unused_field
  int _counter = 0;

  // Gets the location
  double lat = 51.1;
  double lng = -2.0;
  final _LocationService = LocationService();

  _fetchLocation() async {
    Position position = await _LocationService.getLatLong();
    lat = position.latitude;
    lng = position.longitude;
  }

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _fetchLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      bottomNavigationBar: bottomNavigationBar(context),
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
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Navigating to station details...")),
                );
              },
              child: Text('More Details'),
            ),
          ],
        ),
      ),

      // FlutterMap(
      //   options: MapOptions(
      //     initialCenter: LatLng(lat, lng),
      //     initialZoom: 15.1,
      //   ),
      //   children: [
      //     TileLayer(
      //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      //       userAgentPackageName: 'com.example.app',
      //     ),
      //     RichAttributionWidget(
      //       attributions: [
      //         TextSourceAttribution('OpenStreetMap contributors',
      //             onTap: () =>
      //                 {} //launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
      //             ),
      //       ],
      //     ),
      //   ],
      // ),
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

  NavigationBar bottomNavigationBar(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Theme.of(context).navigationBarTheme.indicatorColor,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.search_outlined)),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.pin_drop_rounded),
          ),
          label: 'Saved Locations',
        ),
      ],
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
