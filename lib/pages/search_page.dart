import 'package:flutter/material.dart';
import 'package:fuelwise/service/gas_buddy_service.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';
import 'package:fuelwise/widgets/search.dart';
import 'package:fuelwise/widgets/station_card.dart';
import 'package:fuelwise/widgets/top_information.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Page', style: TextStyle(fontSize: 24)),
    );
  }
}
