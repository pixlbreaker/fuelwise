import 'package:flutter/material.dart';
import 'package:fuelwise/service/gas_buddy_service.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/widgets/station_card.dart';
import 'package:fuelwise/widgets/top_information.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables used on the homepage
  final _gasBuddyService = GasBuddyService();
  int? count = 0;
  String postalCode = "";
  double? topPrice = 0;
  String topName = "";
  String topAddress = "";
  late List<Results> stations;
  double lat = 0.0;
  double lng = 0.0;

  void _getInitialInfo(String search) async {
    if (!mounted) return;

    if (search == "") {
      // Gets the Location and the postal code
      // ignore: unused_local_variable
      LocationPermission permission;
      permission = await Geolocator.requestPermission();

      // Sets the position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      lat = position.latitude;
      lng = position.longitude;

      // Sets the postalcode
      postalCode = placemarks[0].postalCode.toString();
    } else {
      postalCode = search;
    }

    // Makes the post request
    final model = await _gasBuddyService.stationPostRequest(postalCode);

    // Sets the data for the state
    setState(() {
      count = model.data.locationBySearchTerm.stations.count;
      if (count! > 20) count = 20;
      stations = model.data.locationBySearchTerm.stations.results;

      // Gets the top Price
      topPrice = stations[0].prices[0].credit.price! / 100;
      topPrice = double.parse(topPrice!.toStringAsFixed(2));
      topName = stations[0].name;
      topAddress = stations[0].address.line1;
    });
  }

  // Refresh when pulling down
  Future<void> _pullRefresh() async {
    _getInitialInfo("");
  }

  // init state
  @override
  void initState() {
    super.initState();
    _getInitialInfo("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            TopInformation(topPrice!, topName, topAddress),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color.fromRGBO(97, 99, 119, 1),
              ),
            ),
            stationsView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getInitialInfo("");
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }

  Container stationsView() => Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return StationCard(stations[index], lat, lng);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15.0,
            );
          },
          itemCount: count!.toInt(),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        ),
      );
}
