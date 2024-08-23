import 'package:flutter/material.dart';
import 'package:fuelwise/pages/map.dart';
import 'package:fuelwise/service/gas_buddy_service.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
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
  late List<Results> stations;

  void _getInitialInfo() async {
    if (!mounted) return;

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

    // Makes the post request
    final model = await _gasBuddyService.stationPostRequest(postalCode);

    // Sets the data for the state
    setState(() {
      count = model.data.locationBySearchTerm.stations.count;
      stations = model.data.locationBySearchTerm.stations.results;
    });
  }

  // Refresh when pulling down
  Future<void> _pullRefresh() async {
    _getInitialInfo();
  }

  // init state
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
            ElevatedButton(
                onPressed: () {
                  print('This');
                },
                child: Text("Search")),
            Text(postalCode),
            Text(count.toString()),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapScreen(),
                    ),
                  );
                },
                child: Text('Map')),
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
            return Container(
                width: 100,
                height: 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(stations[index].name),
                      Text(stations[index].prices[0].credit.price.toString()),
                      Text(stations[index].address.line1)
                    ]));
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 25,
            height: 25,
          ),
          itemCount: count!.toInt(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        ),
      );

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Fuel Wise',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 28),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: IconButton(
              icon: const Icon(Icons.light_mode, size: 28),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
