import 'package:flutter/material.dart';
import 'package:fuelwise/service/gas_buddy_service.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';
import 'package:fuelwise/widgets/search.dart';
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
  final _gasBuddyService = GasBuddyService();
  final _controller = TextEditingController();
  int? count = 0;
  String postalCode = "";
  double? topPrice = 0;
  late List<Results> stations;

  void _getInitialInfo(String search) async {
    if (!mounted) return;

    if (search == "") {
      // Gets the Location and the postal code
      // ignore: unused_local_variable
      LocationPermission permission;
      permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

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
      appBar: appBar(context),
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            TopInformation(topPrice!),
            Row(
              children: <Widget>[
                Expanded(
                  child: SearchInput(
                    textController: _controller,
                    hintText: "Search",
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    _getInitialInfo(_controller.text);
                  },
                  child: Text("Search"),
                  style: Theme.of(context).elevatedButtonTheme.style,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color.fromRGBO(97, 99, 119, 1),
              ),
            ),
            stationsView(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Container stationsView() => Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return StationCard(stations[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15.0,
            );
          },
          itemCount: count!.toInt(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        ),
      );

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
      ),
      centerTitle: true,
      title: const Text("Fuel Wise"),
      actions: [
        NotificationBell(),
      ],
    );
  }
}
