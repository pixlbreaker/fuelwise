import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/models/test_post_request.dart';
import 'package:fuelwise/pages/map.dart';
import 'package:fuelwise/models/station_model.dart';
import 'package:fuelwise/service/gas_buddy_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _getInitialInfo() async {
    //PostRequestModel.testPostRequest("quidem molestiae enim");
    //Future<Data> data = StationModel.stationPostRequest('title');

    final _gasBuddyService = GasBuddyService();
    Data? _data;
    final data = await _gasBuddyService.stationPostRequest('test');
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );
              },
              child: Text('Map'))
        ],
      ),
    );
  }

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
